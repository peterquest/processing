int posX=32;
int posY=150;
double timer = 0;

void setup() {
	textSize(40);
	background(50);
	size(800,500);
	rect(590,10,200,100);
	fill(0,100,153);
	text("TYPE FOR ME PLZ", 590, 20, 200, 100);
}

void draw () {
	fill(0,100,153);
  if (posX>800) {
		posY+=32;
		posX=10;
	}
  if (posY>532) {
  fill(50);
  rect(0,0,800,500);
  fill(255);
	rect(590,10,200,100);
	fill(0,100,153);
	text("TYPE FOR ME PLZ", 590, 20, 200, 100);
  posX=32;
  posY=150;
  }
}

void keyPressed () {
	if (key != CODED) {
	text(key, posX, posY);
	posX+=20;
	}
	
}


void mouseClicked() {

	if ((mouseX < 740) && (mouseX > 460) && (mouseY > 10) && (mouseY <100)) {
		for (int i=0; i<100; i++) {
			char randKey = char(int(random(97,122))); 
			text(randKey, posX, posY);
			posX+=20;
    }
  }
}

