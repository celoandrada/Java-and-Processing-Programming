 import java.util.Scanner; public class WordCounter {
// Pre-conditions:
// - 'scanner' must be a valid Scanner object connected to the console.
// - 'start' and 'end' must be characters. The method will throw an IllegalArgumentException if
they are not letters.
// Post-conditions:
// - Returns the count of words not starting with a letter in the specified range.
// - Throws IllegalArgumentException if 'start' or 'end' is not a letter, but this check is moved to
the main method.
public static int countInvalidWords(Scanner scanner, char start, char end) {
System.out.println("Enter words, and to finish, enter a word that starts with a non-letter character.");
start = Character.toLowerCase(start); end = Character.toLowerCase(end);
// Ensure 'start' is less than 'end' if (start > end) {
char temp = start; start = end;
end = temp;
}
int count = 0;
while (scanner.hasNext()) {
String word = scanner.next();
char firstChar = Character.toLowerCase(word.charAt(0));
if (!Character.isLetter(firstChar) || firstChar < start || firstChar > end) {
if (!Character.isLetter(word.charAt(0))) { break;
}
count++; }
}
return count; }
public static void main(String[] args) {
Scanner scanner = new Scanner(System.in);

 // Test 1
System.out.println("Test 1: Enter words (valid range: a-k)."); int count1 = countInvalidWords(scanner, 'a', 'k'); System.out.println("Invalid words count: " + count1);
// Test 2
System.out.println("\nTest 2: Enter words (valid range: q-z)."); int count2 = countInvalidWords(scanner, 'Z', 'q'); System.out.println("Invalid words count: " + count2);
// Test 3
System.out.println("\nTest 3: Enter the two characters for validation (e.g., a z)."); char startChar = scanner.next().charAt(0);
char endChar = scanner.next().charAt(0);
try {
if (!Character.isLetter(startChar) || !Character.isLetter(endChar)) {
throw new IllegalArgumentException("Both parameters must be letters."); }
System.out.println("Now, enter words (invalid character test)."); int count3 = countInvalidWords(scanner, startChar, endChar); System.out.println("Invalid words count: " + count3);
} catch (IllegalArgumentException e) {
System.out.println("Caught expected IllegalArgumentException: " + e.getMessage());
} }
}
