/* NOTE FOR FUTURE CHANGES!:
 *
 * Made those changes but it still doesnt exactly match the video
 * that I based this off of. This is because when people paint
 * mountains they dont allow the peaks to be very close. the 
 * mountains are also oddly pointy.
 *
 * I can probably address these things, but I'm not sure if i care
 * that much.
 *
 * options for rounding mountains: 
 *  1. create new shape
 *  2. rotate a rectangle with curved edges. tricky!
 */


class Mountain {
  color mountainColor;
  int x1pos, y1pos, x2pos, y2pos, x3pos, y3pos, baseWidthOverTwo;
  int speed = 1; //probably wont need this unless i add parallax

  Mountain(x2, y2) { //give the constructor a point for the peak
                           // keep in mind we fudge this point for randomness
                           // there is no need for precision really.
    mountainColor = int(random(0,225));
    x2pos = x2+int(random(0,400)); //generate the peak first!
    y2pos = y2+int(random(0,75));
    baseWidthOverTwo = random(150,250); //guarantees isoceles as
    x1pos = x2pos-baseWidthOverTwo; // x1 and x3 are evenly balanced
    y1pos = height;                // from either side of the peak
    x3pos = x2pos+baseWidthOverTwo;
    y3pos = height;
  }
 
 // default constructor. always starts mountains off the right edge
 // of the screen
  Mountain () {
    this(1050,225);
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
PImage skier = loadImage("skierSmall.png");
float skierHeight;
float skierDelta = TWO_PI/60;

void setup() {
  size(800,500);
  noStroke();
  frameRate(60); // adjust as u want
  // load the mountain array with 35 mountains. 
  for (int i=-5; i<30;i++) {
  mountains.add(new Mountain(i*30,225));

  }
}

void draw() {
 background(225);

//draw the skier and have him float. probably 120 should be a 
//variable called 'phase' or something
image(skier, 50, 50+(10*sin(frameCount%120*TWO_PI/120)));

 if (frameCounter%42 == 0) { //the magic number
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
