float distFromCenter(int x, int y) {
 float dist;
 dist = sqrt(sq(x - width/2) + sq(y - height/2));

 return dist;

}

// for easy c&p! |
//                       |
//                      V
void setup() {
 size(400,400);
 textSize(24);
}

void draw() {
 background(0);
 text("distance from center: " + distFromCenter(mouseX, mouseY), 5,25);
}
