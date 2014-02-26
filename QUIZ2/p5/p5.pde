float mouseSpeed;
color bg = color(120,0,50,25);
color circleColor = color(255);
void setup() {
 size(600,400);
 stroke(255);
}

void draw() {
 fill(120,0,50,25);
 rect(0,0,width,height);
 mouseSpeed = distTraveled(mouseX, mouseY);
 //mousePressed?fill(255):noFill();
 fill(mousePressed?circleColor:bg); //tasty syntactic sugar. 
 ellipse(mouseX,mouseY,mouseSpeed,mouseSpeed); 
 
}

float distTraveled(int x, int y) {
 float dist;
 dist = sqrt(sq(x - pmouseX) + sq(y - pmouseY));
 return dist;
}

