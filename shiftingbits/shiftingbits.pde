float shade = 0;
float shadeList[] = new shadeList[height+width];
int cnt = 0;

void setup() {
size(800,600);
frameRate(300);
for (int i=0; i<width+height; i++) {
  shade += 256.0/(height+width);
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
        point((cnt%(width+height-i)),i);
  }
  cnt++;
  }

