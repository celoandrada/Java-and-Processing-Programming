// Marcelo Batista
// This program will draw a surprised emote that will change directions without 
// trespassing the boundaries, and stopping completely if it hits a boundary!!
// But if it is moving it will change colors and be able to change directions
// It also resets the draw and makes the background to black whenever a key is pressed

// Global variables
int circleX, circleY; // Emoji position
int circle1, circle2; // Eye positions
int rect1; // Eyebrow position
int speed; // Emoji movement speed

float r, g, b, a; // Color variables

void setup() {
  size(600, 300);
  initializeEmoji(); // Initialize emoji position and speed
}

void draw() {
  background(0);
  drawEmoji(); // defined variable to draw the emoji
  moveEmoji(); // defined variable to move the emoji
  limitEmoji(); // // defined variable to constrain emoji
}

void initializeEmoji() {
  circleX = 300;
  circleY = 150;
  circle1 = 280;
  circle2 = 320;
  rect1 = 265;
  speed = 1;
}

void drawEmoji() {
  r = random(100); // random colors that will keep alternating
  g = random(150); // random colors that will keep alternating
  b = random(200); // random colors that will keep alternating
  a = random(255); // random colors that will keep alternating

  fill(r, g, b);
  ellipse(circleX, circleY, 100, 100);

  fill(255);
  ellipse(circle1, circleY, 25, 25);
  ellipse(circle2, circleY, 25, 25);

  fill(0);
  ellipse(circle1, circleY, 10, 10);
  ellipse(circle2, circleY, 10, 10);

  noFill();
  arc(circle1, circleY - 10, 30, 30, radians(220), radians(320));
  arc(circle2, circleY - 10, 30, 30, radians(220), radians(320));

  fill(0, 0, 0);
  rect(rect1, circleY + 15, 70, 20, 15);
}

void moveEmoji() {
  circle1 += speed;
  circle2 += speed;
  circleX += speed;
  rect1 += speed;
}

void limitEmoji() {
  if (circle1 <= 30 || circle1 >= 530) {
    stopEmoji();
  }
}

void stopEmoji() {
  circleX = constrain(circleX, 50, 550);
  circle1 = constrain(circle1, 30, 530);
  circle2 = circle1 + 40;
  rect1 = constrain(rect1, 15, 515);
  speed = 0;
}

void mouseClicked() {
  reverseEmojiDirection();
}

void reverseEmojiDirection() {
  speed *= -1;
}

void keyPressed() {
  resetBackground();
}

void resetBackground() {
// reset background making the whole emoji disappear 
  background(0);
  strokeWeight(100);
}
