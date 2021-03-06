/*import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
*/


class Mountain {
  color mountainColor;
  int x1pos, y1pos, x2pos, y2pos, x3pos, y3pos;
  int speed = 1; //probably wont need this unless i add parallax

  Mountain() {
    mountainColor = int(random(255));
    x1pos = 800;
    y1pos = height;
    x2pos = 800+int(random(150,250));
    y2pos = 300+int(random(25,60)); //tweak these to make them look normal
    x3pos = 1200;
    y3pos = height;
  }

  void drawMountain() {
    fill(mountainColor);
    triangle(x1pos,y1pos,x2pos,y2pos,x3pos,y3pos);
  }

  void moveMountain() {
    x1pos--;
    x2pos--;
    x3pos--;
    if (x3pos<0) {
      println("wat! ");
    }
  }
}

ArrayList mountains = new ArrayList();
//Iterator iter = mountains.iterator();
int frameCounter=0;

void setup() {
  size(800,500);
  noStroke();
  frameRate(300); //super fast just for testing.
//  mountain = new Mountain();
/*  List<Mountain> mountainList = new LinkedList<Mountain>();
  for (int i=0;i<4;i++) {
    mountainList.add(new Mountain());
  }
*/
}

void draw() {
  background(255);
/*
  for (int i=0; i<4; i++) {
    mountainList.get(i).moveMountain();
    mountainList.get(i).drawMountain();
  }
*/
 // if (frameCounter%5 == 0) {
    mountains.add(new Mountain());
 // }

  for (int i=0; i<mountains.size(); i++) {
    Mountain m = (Mountain) mountains.get(i);
    m.moveMountain();
    m.drawMountain();
  }

//  mountain.moveMountain();
 // mountain.drawMountain();
}
