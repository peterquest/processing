void setup() {
colorMode(HSB, 100);
size(500,500);
background(50,50,100);
}

color getColor(int x, int y) {

 color c;
 float distFromCenter;
 
 distFromCenter = sqrt(sq(x - width/2) + sq(y - height/2));
 c = color(100, 100, distFromCenter/318.0*100); // 318 is the approximate max distance based on a 500x500, this way it should scale evenly. it's not great code but it'll do.
 
 return c;
}

void draw() {

  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      int x = j*width/10+25;
      int y = i*height/10+25;
      fill(getColor(x,y));

      ellipse(x, y, width/10, height/10);
    }
  }
}
