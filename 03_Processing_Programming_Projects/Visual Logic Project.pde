// Marcelo Batista
// This program will draw three emojis that will change directions without trespassing 
// the boundaries, and will stop the emoji completely when it hits a boundary!! 
// This program will also clear the background when a key is pressed!!

class Emoji {
  int x, y;
  int eye1, eye2;
  int eyebrow;
  int speed;
  float colorR, colorG, colorB, colorA;
  // emoji contents

  Emoji() {
    initialize();
  }

  Emoji(int initialX, int initialY, int initialSpeed) {
    initialize();
    x = initialX;
    y = initialY;
    speed = initialSpeed;
  }
  // converting default variables to our own variables

  void initialize() {
    x = width / 2;
    y = height / 2;
    eye1 = -20;
    eye2 = 20;
    eyebrow = -35;
    speed = 1;
    
  }

  void draw() {
    setColor();
    fill(colorR, colorG, colorB);
    ellipse(x, y, 100, 100);

    fill(255);
    ellipse(x + eye1, y, 25, 25);
    ellipse(x + eye2, y, 25, 25);

    fill(0);
    ellipse(x + eye1, y, 10, 10);
    ellipse(x + eye2, y, 10, 10);

    noFill();
    arc(x + eye1, y - 10, 30, 30, radians(220), radians(320));
    arc(x + eye2, y - 10, 30, 30, radians(220), radians(320));

    fill(0, 0, 0);
    rect(x + eyebrow, y + 15, 70, 20, 15);
  }
  // drawing the emoji 

  void move() {
    x += speed;
  }

  void limit() {
    if (x <= 30 || x >= width - 30) {
      stop();
    }
  }
  // constrain the emoji from moving out of the canvas 
  
  void stop() {
    x = constrain(x, 50, width - 50);
    speed = 0;
  }

  void reverseDirection() {
    speed *= -1;
  }
  // switching directions emoji is moving

  void setColor() {
    colorR = random(100);
    colorG = random(150);
    colorB = random(200);
  }
}

Emoji[] emojis;

void setup() {
  size(600, 300);
  emojis = new Emoji[3];
  emojis[0] = new Emoji(100, 50,  1);
  emojis[1] = new Emoji(250, 150, 1);
  emojis[2] = new Emoji(400, 250, 1);
}
  // creates 3 different emojis

void draw() {
  background(0);

  for (Emoji emoji : emojis) {
    emoji.move();
    emoji.limit();
    emoji.draw();
  }
}

void mouseClicked() {
  for (Emoji emoji : emojis) {
    emoji.reverseDirection();
  }
}
  // switches directions when mouse is clicked

void keyPressed() {
  resetBackground();
}
  // resets background

void resetBackground() {
  background(0);
  strokeWeight(100);
}
  // makes the whole background black and cleans the screen
  // end of draw
