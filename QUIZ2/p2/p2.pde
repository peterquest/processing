int width = 500;
int height = 500;
int numSquares = 5;
float offset = (width/numSquares)/2;
int strokeValue = 25;
int fillValue = 240; 
int swap;

void setup() {
 size(width,height);
 fill(fillValue,15);
}


void draw() {
 rect(0,0,width,height);
 for (int j=0; j<numSquares; j++) {
  for (int i=0; i<numSquares; i++) {
   line((i*width/numSquares)+offset,
          (j*height/numSquares)+offset,
          mouseX,
          mouseY);
  }
 }
}

void mousePressed() {
 fill(strokeValue, 15);
 stroke(fillValue);
 swap = fillValue;
 fillValue = strokeValue;
 strokeValue = swap;
}
