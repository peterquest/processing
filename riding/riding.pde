class Mountain {
  color mountainColor;
  int x1pos, y1pos, x2pos, y2pos, x3pos, y3pos;
  int speed = 1; //probably wont need this unless i add parallax

  Mountain() {
    mountainColor = random(255);
    x1pos = 800;
    y1pos = height;
    x2pos = 800+int(random(150,250));
    y2pos = 300+int(random(25,60)); //tweak these to make them look normal 
    x3pos = 1200+int(random(150,250);
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
      mountain = new Mountain();
    }
  }
}

void setup() {
  size(800,500);
  noStroke();
  frameRate(300); //super fast just for testing.
  mountain = new Mountain();
}

void draw() {

  background(255);
  mountain.moveMountain();
  mountain.drawMountain();
}
