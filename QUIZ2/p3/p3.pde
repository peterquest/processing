 void star(int centerX, int centerY) {

  PShape s;
  s = createShape();
  s.beginShape();
  s.vertex(centerX, centerY-40); //1
  s.vertex(centerX+10 , centerY-10); //2
  s.vertex(centerX+40 , centerY-10); //3
  s.vertex(centerX+15 , centerY+10);//4
  s.vertex(centerX+35 , centerY+40);//5
  s.vertex(centerX , centerY+20);//6
  s.vertex(centerX-35 , centerY+40);//7
  s.vertex(centerX-15, centerY+10);//8
  s.vertex(centerX-40 , centerY-10);//9
  s.vertex(centerX-10, centerY-10);//10
  s.vertex(centerX, centerY-40);//close
  s.endShape();

  shape(s, centerX, centerY);

}

void setup(){
 size(400,100, P2D); 
 background(50,0,200);
 for (int i=0; i<4; i++) {
  star(i*50+25, 25);
 }
}

void draw() {
}
