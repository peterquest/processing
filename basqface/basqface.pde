int x,y;
PImage face = loadImage("basqfacesmall.jpg");
int dimension = face.width * face.height;
color c;
void setup() {
  size(400,500);
face.loadPixels();
  for (int i=0; i<1000; i++){
    println(pixels[i]);}
}

void draw () { 
fill(c);
x=random(width);
y=random(height);
ellipse(x,y,10,10);
image(face,0,0);
}
