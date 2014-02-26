int circleRadius = 50;
int xSpeed = 15; //making these speeds different makes for
int ySpeed = 8; // a wackier path. high speeds are fun!
int x = circleRadius+50;
int y = circleRadius;

void setup() {
 size(2000,1600);
}

void draw() {
 fill(120,0,10,50);
 rect(0,0,width,height);
 x+=xSpeed;
 y+=ySpeed;
 fill(255);
 ellipse(x,y,circleRadius*2,circleRadius*2);
 detectWall(x,y);

}


void detectWall(int x, int y) {
 int rightEdge = x + circleRadius;
 int leftEdge = x - circleRadius;
 int topEdge = y - circleRadius;
 int bottomEdge = y + circleRadius;

 if ((rightEdge >= width) || (leftEdge <= 0)) {
  xSpeed = -xSpeed;
}
 if ((bottomEdge >= height) || (topEdge <=0)) {
  ySpeed = -ySpeed;
 }
}
