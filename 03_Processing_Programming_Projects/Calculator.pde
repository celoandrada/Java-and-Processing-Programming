// Name: Marcelo Batista
// This program provides a basic graphical interface for a calculator. 

// Calculator colors
color background_color = color(0, 0, 0);          // Background color
color entry_color = color(255, 255, 255);        // Color for the entry display
color entry_text_color = color(10, 3, 40);        // Color for the text in the entry display
color button_color = color(255, 255, 255);       // Color for buttons
color button_text_color = color(93, 67, 355);    // Color for button text

// Variables
int pKey = ' ';         // Unused variable
float value_1, value_2; // Values for calculations
int position = 0;       // Position to track the state of the calculator (0, 1, 2, or 4)
String operation = "";  // String to store the current operation

String entry_text = ""; // String to store and display the input and result

void setup() {
  size(400, 500);
  background(background_color);
  noStroke();
  textSize(30);
}

void draw() {
  reset();
  input();
}

void reset() {
  // Reset the canvas
  background(background_color);

  // Display entry area
  fill(entry_color);
  rect(10, 10, 380, 50);

  // Display entry text
  fill(entry_text_color);
  text(entry_text, 20, 45);

  // Display calculator buttons
  fill(button_color);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      rect(10 + i * 100, 100 + j * 100, 80, 80, 20);
    }
  }

  // Display button text
  fill(button_text_color);
  String[] buttonTexts = {"1", "2", "3", "/", "4", "5", "6", "*", "7", "8", "9", "-", "C", "0", "=", "+"};
  for (int i = 0; i < buttonTexts.length; i++) {
    text(buttonTexts[i], 27 + i % 4 * 100, 162 + floor(i / 4) * 100);
  }
}

void input() {
  // Handle user input
  if (keyPressed) {
    handleKey(key);
  } else if (mousePressed) {
    handleMouse();
  }
}

void handleKey(char k) {
  // Handle key presses
  if (k >= '0' && k <= '9') {
    handleDigit(k - '0');
  } else if (k == '+' || k == '-' || k == '*' || k == '/') {
    handleOperation(k);
  } else if (k == '=') {
    handleEquals();
  } else if (k == 'C') {
    resetCalculator();
  }
}

void handleMouse() {
  // Handle mouse clicks for buttons
  int mouseXPos = mouseX;
  int mouseYPos = mouseY;

  for (int i = 0; i < 16; i++) {
    int buttonX = 10 + i % 4 * 100;
    int buttonY = 100 + floor(i / 4) * 100;
    
    // Check if the mouse is over a button
    if (mouseXPos > buttonX && mouseXPos < buttonX + 80 && mouseYPos > buttonY && mouseYPos < buttonY + 80) {
      // Execute corresponding action based on the button
      if (i < 12) {
        handleDigit(i % 4 + 1 + floor(i / 4) * 3);
      } else if (i == 12) {
        handleOperation('-');
      } else if (i == 13) {
        resetCalculator();
      } else if (i == 14) {
        handleEquals();
      } else if (i == 15) {
        handleOperation('+');
      }
    }
  }
}

void handleDigit(int digit) {
  // Handle digit input
  if (position == 1) {
    position = 2;
  }
  entry_text += str(digit);
}

void handleOperation(char op) {
  // Handle operation input
  if (position == 0) {
    position = 1;
  } else if (position == 4) {
    position = 1;
  } else if (position == 1) {
    operation = String.valueOf(op);
    entry_text += operation;
  }
}

void handleEquals() {
  // Handle equals button press
  if (operation.equals("+")) {
    entry_text = str(eval(entry_text) + eval(entry_text.substring(entry_text.indexOf(operation) + 1)));
  } else if (operation.equals("-")) {
    entry_text = str(eval(entry_text) - eval(entry_text.substring(entry_text.indexOf(operation) + 1)));
  } else if (operation.equals("*")) {
    entry_text = str(eval(entry_text) * eval(entry_text.substring(entry_text.indexOf(operation) + 1)));
  } else if (operation.equals("/")) {
    entry_text = str(eval(entry_text) / eval(entry_text.substring(entry_text.indexOf(operation) + 1)));
  }
  position = 4;
  operation = "";
}

float eval(String expr) {
  // Evaluate an expression with addition
  return eval(expr, '+', 0);
}

float eval(String expr, char operator, int startIndex) {
  // Evaluate an expression with a specified operator and starting index
  float result = 0;
  String[] tokens = splitTokens(expr, "" + operator);
  for (int i = startIndex; i < tokens.length; i++) {
    result += float(tokens[i]);
  }
  return result;
}

float eval(String expr, char operator) {
  // Evaluate an expression with addition
  float result = 0;
  String[] tokens = splitTokens(expr, "" + operator);
  for (int i = 0; i < tokens.length; i++) {
    result += float(tokens[i]);
  }
  return result;
}

void resetCalculator() {
  // Reset the calculator state
  entry_text = "";
  position = 0;
  operation = "";
}
