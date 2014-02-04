class Point {
  int x;
  int y;
  color c;

  Point (int x, int y, color c) {
      this.x = x;
      this.y = y;
      this.c = c;
  }
}

float shade = 0;
float shadeList[] = new shadeList[width];
int cnt = 0;

void setup() {
size(800,600);
frameRate(300);
for (int i=0; i<width; i++) {
  shade += 256.0/width
  shadeList[i] = shade;
}

}

void draw() {
 /*
  Point p = new Point(random(width), random(height), c);
  point(p.x, p.y, p.c);
  */
  for (int i=0; i<height; i++) {
        shade = (shadeList[frameCount%width]);
        stroke(shade);
        point((cnt%width-i),i);
  }
  cnt++;
  println(shade);
  }

