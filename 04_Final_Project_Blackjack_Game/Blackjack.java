import java.util.*;
public class BlackjackGame {
public static void main(String[] args) {
Scanner userInput = new Scanner(System.in);
int balance = 100; // Starting balance
boolean continuePlaying = true;
while (continuePlaying && balance > 0) {
int betAmount = bet(userInput, balance);
balance -= betAmount;
int playerTotal = 0;
int dealerTotal = 0;
playerTotal = playerTurn(userInput);
if (playerTotal <= 21) {
dealerTotal = dealerTurn(userInput);
}
String outcome = determineWinner(playerTotal, dealerTotal);
balance = updateBalance(balance, betAmount, outcome);
System.out.println("Round result: " + outcome);
System.out.println("Your current balance: $" + balance);
System.out.print("Play again? (yes/no): ");
continuePlaying = userInput.nextLine().equalsIgnoreCase("yes");
}
System.out.println("Game over. Final balance: $" + balance);
userInput.close();
}
public static int bet(Scanner input, int balance) {
int bet;
do {
System.out.println("Your balance: $" + balance);
System.out.print("Enter bet amount: ");
bet = input.nextInt();

input.nextLine(); // clear newline
} while (bet <= 0 || bet > balance);
return bet;
}
public static int playerTurn(Scanner input) {
int total = drawCard(input);
boolean playerTurn = true;
while (playerTurn && total <= 21) {
System.out.println("Your total: " + total);
System.out.print("Hit or stand? ");
String choice = input.nextLine().toLowerCase();
if (choice.equals("hit")) {
total += drawCard(input);
} else {
playerTurn = false;
}
}
if (total > 21) {
System.out.println("Bust! You went over 21.");
}
return total;
}
public static int dealerTurn(Scanner input) {
int total = drawCard(input);
while (total < 17) {
total += drawCard(input);
}
System.out.println("Dealer total: " + total);
return total;
}
public static int drawCard(Scanner input) {
String[] cards = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"};
int[] values = {2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11};
Random rand = new Random();
int index = rand.nextInt(cards.length);
String card = cards[index];
int value = values[index];

System.out.println("Drew card: " + card);
if (card.equals("A")) {
System.out.print("Choose value for Ace (1 or 11): ");
int aceValue = input.nextInt();
input.nextLine(); // clear newline
value = (aceValue == 1) ? 1 : 11;
}
return value;
}
public static String determineWinner(int player, int dealer) {
if (player > 21) return "Lose";
if (dealer > 21) return "Win";
if (player > dealer) return "Win";
if (player < dealer) return "Lose";
return "Tie";
}
public static int updateBalance(int balance, int bet, String outcome) {
switch (outcome) {
case "Win": return balance + bet * 2;
case "Tie": return balance + bet;
default: return balance;
}
}
}
