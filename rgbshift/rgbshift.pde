/* @pjs preload="fordy.jpg"; */
PImage fordy;
int numPixels;

void setup() {
size(472,768);
fordy = loadImage("fordy.jpg");
numPixels = height*width;
loadPixels();
for (int i=0; i<numPixels; i++) {

pixels[i] = rgbshift(pixels[i]);
updatePixels();

image(fordy,0,0);

}


}
void draw() {

}


color rgbshift(color c) {

//int a = (c >> 24) & 0xFF;
int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
int b = c & 0xFF;          // Faster way of getting blue(argb)

return color(g,b,r);

}
