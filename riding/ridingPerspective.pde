/* NOTE FOR FUTURE CHANGES!:
 *
 * Made those changes but it still doesnt exactly match the video
 * that I based this off of. This is because when people paint
 * mountains they dont allow the peaks to be very close. i could add
 * a check in the constructor or check what the constructor returns.
 * the mountains are also oddly pointy.
 *
 * I can probably address these things, but I'm not sure if i care
 * that much.
 *
 * options for rounding mountains: 
 *  1. create new shape
 *  2. rotate a rectangle with curved edges. tricky!
 */

ArrayList mountains = new ArrayList();
ArrayList fastMountains = new ArrayList();
PImage skier = loadImage("skierSmall.png");

class Mountain {
  color mountainColor;
  float x1pos, y1pos, x2pos, y2pos, x3pos, y3pos, baseWidthOverTwo;
  int maxWidthOverTwo = 250; //bases of mountains range from
  int minWidthOverTwo = 150; // min*2 to max*2
  int speed = 1; //probably wont need this unless i add parallax

  Mountain(x2, y2, sp) { //give the constructor a point for the peak
                     // keep in mind we fudge this point for randomness
                     // there is no need for precision really.
    mountainColor = int(random(0,225));
    x2pos = x2+int(random(0,400)); //generate the peak first!
    y2pos = y2+int(random(0,75));
    baseWidthOverTwo = random(minWidthOverTwo,maxWidthOverTwo); //guarantees isoceles as
    x1pos = x2pos-baseWidthOverTwo; // x1 and x3 are evenly balanced
    y1pos = height;                // from either side of the peak
    x3pos = x2pos+baseWidthOverTwo;
    y3pos = height;
    speed = sp;
  }
 
 // default constructor. always starts mountains off the right edge
 // of the screen
  Mountain () {
    this(1050,225, 1);
  }

  void drawMountain() {
    fill(mountainColor);
    triangle(x1pos,y1pos,x2pos,y2pos,x3pos,y3pos);
  }

    // at some point i will change moveMountain() to use the variable 'speed'
    // as a modifier to create parallax instead of just moving 1px
    // per frame.
  void moveMountain() {
    x1pos-=speed;
    x2pos-=speed;
    x3pos-=speed;
  }
}

void setup() {
  size(800,500);
  noStroke();
  frameRate(40); // adjust as u want
  // load the mountain array with 30 mountains. 
  for (int i=-5; i<25;i++) {
  mountains.add(new Mountain(i*30,225,1));
  fastMountains.add(new Mountain(i*30,225,3));

  }
}

void draw() {
 background(225);

//draw the skier and have him float. probably 120 should be a 
//variable called 'phase' or something
image(skier, 50, 50+(10*sin(frameCount%120*TWO_PI/120)));


 if (frameCount%28 == 0) { // 3x as many fast mts as slow

    fastMountains.add(new Mountain(1050,225,3));

 if (frameCount%84 == 0) {
    
    mountains.add(new Mountain());
 }
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
  for (int i=0; i<fastMountains.size(); i++) {
    Mountain m = (Mountain) fastMountains.get(i);
    if (m.x3pos<0) {   //make this a method
      fastMountains.remove(i);
    }
    else{
    m.moveMountain();
    m.drawMountain();
    }
  }
}
