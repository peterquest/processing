int gearsize = 200;
float dx, topArcStart, topArcEnd, bottomArcEnd,topArcEnd;

void setup () {
size(800,600);
colorMode(HSB,360,100,100);
mouseY = height/2;
mouseX = width/2;
noStroke();
}

void draw () {

  background(50);
  dx = ((width/2.0)-mouseX)/(width/2.0)
  fill(360-(mouseY/(600/360)),100,70);
  drawTopArc();
  drawBottomArc();

}


void drawTopArc() {

  topArcStart = radians(-dx*90);
  topArcEnd = topArcStart + PI;

  arc(mouseX + dx*(gearsize/4), mouseY-(gearsize/2),
      gearsize,gearsize, topArcStart, topArcEnd);
}



void drawBottomArc() {

  bottomArcStart = radians((dx*90)+180);
  bottomArcEnd = bottomArcStart + PI;

  arc(mouseX + dx*(gearsize/4), mouseY+(gearsize/2),
      gearsize,gearsize, bottomArcStart, bottomArcEnd);

}
