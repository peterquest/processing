int bubWidth = 20;
int bubHeight = 20;
ArrayList bubbles = new ArrayList();

void setup() {

  size(640,480);
  fill(255);
  noStroke();
}


void draw() {
background(50);
//  bubbleFromMouse(mouseX, mouseY);
bubbleFromMouse(mouseX,mouseY);
drawBubbles();

}

class Bubble {

  float x;
  float y;
  float direction; // -1 to 1
  int speed;
  int duration;

  Bubble (float x, float y, float dir, int sp, int dur) {
    this.x = x;
    this.y = y;
    this.direction = dir;
    this.speed = sp;
    this.duration = dur;
  }

  void drawBubble() {
    pushStyle();
    fill(255,duration);
    ellipse(x,y,bubWidth,bubHeight);
    popStyle();
    updateBubble();
  }

  void updateBubble() {
    y-= speed; //always moving up at constant rate
    x += (direction*5);
    direction -= direction/10;
    duration--;
}
}

void bubbleFromMouse(int x, int y) {
  bubbles.add(new Bubble(x,y,random(-1,1), int(random(1,4)), 60));
}
  
void drawBubbles() {
  for (int i=0; i<bubbles.size(); i++) {
    Bubble b = (Bubble) bubbles.get(i);
    if (b.duration == 0) bubbles.remove(i);
    else b.drawBubble();
  }
}
