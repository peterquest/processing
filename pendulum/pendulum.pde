int diam = 60;
ArrayList ballz = new ArrayList();

void setup() {
size(1000,550);
fill(125,207,4,220);
frameRate(60);
}


void draw() {
  background(0);
if (frameCount<100) {
  if (frameCount%10 ==0) {
  ballz.add(new PendulumBall());
  }
 }

for (int i=0; i<ballz.size(); i++) {
  PendulumBall b = ballz.get(i);
  b.updatePosition();
 }
}


class PendulumBall {
  int yAmplitude; // 150;
  int xAmplitude; //400;
  float xPos;
  float yPos;
  float speed;
  int cnt = 0;
  
  PendulumBall(int x, int y, int xamp, int yamp, int sp) {
    yAmplitude = yamp;
    xAmplitude = xamp;
    xPos = x;
    yPos = y;
    speed = sp;
  }

  PendulumBall() {
    this(width/2, height/2, int(random(450,450)), int(random(100,200)),1);
  }

  void updatePosition() {

  this.xPos = 500+xAmplitude*sin(cnt%240*TWO_PI/240); 
  this.yPos = 275+yAmplitude*cos(cnt%120*TWO_PI/120); 
  ellipse(xPos, yPos, diam, diam); 
  cnt++;
  }
}
