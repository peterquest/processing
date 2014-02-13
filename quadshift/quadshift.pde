int quad;
width = 800;
height = 500;
mouseX = width/2;
mouseY = height/2;

void setup() {
size(width,height);
}


void draw() {

drawShifter();
adjustColor();
}


// METHODS

// adjusts background color based on quadrand
void adjustColor() {

switch (getQuadrant(mouseX, mouseY)) {
  case 0: fade(85, 40);
          break;
  case 1: fade(140,40);
          break;
  case 2: fade(204,40);
          break;
  case 3: fade(255,40);
          break;
  }
}

// draws our shifter
void drawShifter() {

line(width/2,height/2,mouseX,mouseY);
fill(random(255), random(255), random(255), 50);
ellipse(mouseX,mouseY, 20,20);
}

//used in adjustColor to fill the background
void fade(int tone, int opacity) {

fill(tone, opacity);
rect(-1,-1,width+1, height+1); //0,0,w,h was leaving stroke lines on the edges
}

//returns quadrant that the mouse is in.   ,,,,,,,,,
int getQuadrant(int x, int y) {         // | 0 | 1 |
                                        // |-------|
if ((x < width/2.0) && (y<height/2.0)) {// | 3 | 2 |
  return 0;  }                          // `````````

if ((x> width/2.0) && (y<height/2.0)) {
  return 1;}

if ((x> width/2.0) && (y>height/2.0)) {
  return 2;}

if ((x< width/2.0) && (y>height/2.0)) {
  return 3;}
}
