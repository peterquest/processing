PImage lolwut;
color currentPixelColor;

void setup() {
 size(563,750);
 strokeWeight(20);
 lolwut = loadImage("http://i.imgur.com/lnsAk4F.jpg");
 image(lolwut,0,0);
}

void draw() {
}

void mouseDragged() {
 currentPixelColor = lolwut.get(mouseX, mouseY);
 stroke(currentPixelColor);
 line(pmouseX,pmouseY,mouseX,mouseY);
}
