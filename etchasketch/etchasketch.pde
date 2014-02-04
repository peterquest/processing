void setup() {
size(500,500);
strokeWeight(2);
}


int headX = width/2;
int headY = height/2;

void draw() {
  point(headX,headY);
  if(keyPressed) {
  if(key=='d') {
    fill(200, 90); // the lines are never quite erased
    rect(0,0,width,height);
  }
    if(key==CODED) {

      if(keyCode == DOWN) {
        headY+=1;
      }

      if(keyCode == UP) {
        headY-=1;
      }
      if(keyCode == LEFT) {
        headX-=1;
      }
      if(keyCode == RIGHT) {
        headX+=1;
      }
    }
  }

}
