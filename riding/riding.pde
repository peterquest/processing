/* NOTE FOR FUTURE CHANGES!:
 *
 * I was thinking about how to draw the mountains incorrectly.
 * mountains can be basically described as equilateral or isoceles.
 * so all you need to do is randomly place points throughout a horizontal
 * band and then evenly balance the base coordinates.
 *
 * Then you can get them to overlap by having a variance of about +/-100
 * pixels as you add them to the mountain arraylist.
 *
 * but now i am going to bed.
 *
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
 if (frameCounter%100 == 0) {
    mountains.add(new Mountain());
 }

  for (int i=0; i<mountains.size(); i++) {
    Mountain m = (Mountain) mountains.get(i);
    if (m.x3pos<0) {   //make this a method
      mountains.remove(i);
      println("wutttt");
    }
    else{
    m.moveMountain();
    m.drawMountain();
    }
  }

frameCounter++;
//  mountain.moveMountain();
 // mountain.drawMountain();
}
