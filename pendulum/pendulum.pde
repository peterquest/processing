int yAmplitude = 150;
int xAmplitude = 400;
int diam = 60;
float targetX;
float targetY;
float distance;

void mouseClicked() {
distance = sqrt( (sq(mouseX - targetX)) + (sq(mouseY - targetY)));
if (distance < diam) {
 fill(random(255),random(255),random(255));

}

}


void setup() {
size(1000,550);
frameRate(60);
}


void draw() {
  background(0);
  targetX = 500+xAmplitude*sin(frameCount%240*TWO_PI/240); 
  targetY = 275+yAmplitude*cos(frameCount%120*TWO_PI/120); 
  ellipse(targetX, targetY, diam, diam); 

}
