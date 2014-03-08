import processing.video.*;

Capture cam;

void setup() {
 size(1080,600);
 cam = new Capture(this, 320, 240, 30);
 cam.start();
}

void draw() {
   if(cam.available()) {
    cam.read();
  }
  image(cam, random(width), random(height));
}
