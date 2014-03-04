ArrayList twisterLister = new ArrayList();
int width = 300;
int height = 300;
int gridSizeSq = 3;
int radius = height/gridSizeSq;

class Twister {
  int xPos, yPos;
  int rotation;

  Twister(x,y,r) {
    xPos     = x;
    yPos     = y;
    rotation = r;
  }

  void drawTwister() {
    int rotAmt = radians(rotation);
    fill(220,200,190);
    arc(xPos,yPos, radius, radius, rotAmt, rotAmt+PI, OPEN);
    fill(50,50, 150);
    arc(xPos,yPos, radius, radius, rotAmt+PI, rotAmt+TWO_PI, OPEN);
  }

  void rotateTwister(int degree) {
    rotation+=degree; 
  }
 }


void setup () {
  size(width,height);
  background(0);
  for (int i=0; i<(height/100); i++) {
    for (int j=0; j<(width/100); j++) {
        twisterLister.add(new Twister(j*width/gridSizeSq+50,
                                      i*height/gridSizeSq+50,
                                      j));
    }
  }
}

Twister wat0 = new Twister(width/2+100, height/2+100, 0);

void draw() {
//  updateTwisters();
  drawTwisters();
}



void drawTwisters() {
  for (int i=0; i< twisterLister.size(); i++) {
    Twister t = (Twister) twisterLister.get(i);
    t.rotateTwister(i);
    t.drawTwister();
  }
}


