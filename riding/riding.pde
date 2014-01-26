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
  int x1pos, y1pos, x2pos, y2pos, x3pos, y3pos, baseWidthOverTwo;
  int speed = 1; //probably wont need this unless i add parallax

  Mountain() {

    mountainColor = int(random(0,225));
    x2pos = 950+int(random(0,400)); //generate the peak first!
    y2pos = 225+int(random(0,75));
    baseWidthOverTwo = random(150,250); //guarantees isoceles as
    x1pos = x2pos-baseWidthOverTwo; // x1 and x3 are evenly balanced
    y1pos = height;
    x3pos = x2pos+baseWidthOverTwo;
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
int frameCounter=0;

void setup() {
  size(800,500);
  noStroke();
  frameRate(60); // adjust as u want
}

void draw() {
  background(255);
/*
  for (int i=0; i<4; i++) {
    mountainList.get(i).moveMountain();
    mountainList.get(i).drawMountain();
  }
*/
 if (frameCounter%42 == 0) {
    mountains.add(new Mountain());
 }

  for (int i=0; i<mountains.size(); i++) {
    Mountain m = (Mountain) mountains.get(i);
    if (m.x3pos<0) {   //make this a method
      mountains.remove(i);
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
