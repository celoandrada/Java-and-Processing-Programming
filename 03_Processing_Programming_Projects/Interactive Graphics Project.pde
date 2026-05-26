// Marcelo Batista
// This program will draw a surprised emote that will change directions without 
// trespassing the boundaries, and stopping completely if it hits a boundary!!
// But if it is moving it will change colors and be able to change directions
// It also resets the draw and makes the background to black whenever a key is pressed

// variables 

int circle1 = 280;
int circle2 = 320;
int circleY = 150;
int circleX = 300;
int rect1 = 265;

int speed = 1;

float r;
float g;
float b;
float a;

// program setup

void setup() {
  size(600,300);
}

// program being drawed

void draw() {
  background(0);
  
  r = random(100);
  g = random(150);
  b = random(200);
  a = random(255);
  
  // draw oval face
  fill(r,g,b);
  ellipse(circleX,circleY,100,100);  //  x=300, y=150. Anchor points for mouseX and mouseY
  
  // draw the ovals for the eyes
  fill(255);
  ellipse(circle1,circleY,25,25);  // left eye
  ellipse(circle2,circleY,25,25); // right eye
  
  // draw pupils
  fill(0);
  ellipse(circle1,circleY,10,10);   // left pupil
  ellipse(circle2,circleY,10,10);   // right 
  
  // draw the arcs for the eyebrows
  noFill();
  arc(circle1, circleY-10, 30, 30, radians(220), radians(320));  // left
  arc(circle2, circleY-10, 30, 30, radians(220), radians(320)); // right
  
  // draw the mouth
  fill(0,0,0);
  rect(rect1,circleY+15,70,20,15);

 // move emoji
  circle1 += speed;
  circle2 += speed;
  circleX += speed;
  rect1 += speed;
  
  // limit the emoji from moving of the left edge 
  if (circle1 <= 30) {
    circleX = 50;
    circle1 = 30;
    circle2 = 70;
    rect1 = 15;
    speed = 0;
}
  
  // limit the emoji from moving of the right edge
  if (circle1 >= 530) { 
    circleX = 550;
    circle1 = 530;
    circle2 = 570;
    rect1 = 515;
    speed = 0;
  }
  
// if it hits an edge it will stop moving, it only changes direction 
// while it doesn't hit any of the edges

}

void mouseClicked() {
  
// we make the emoji move forward and backwards with this command
  if (speed == 1){ 
    speed = -1;
}

// if it's not going left it's going right
  else if (speed == -1){ 
    speed = 1;
  }
}

void keyPressed() {
// reset background making the whole emoji disappear 
  background(0);
  strokeWeight(100);
}
