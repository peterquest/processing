void setup() {
	background(50);
	size(1000,500);
	}

	void draw() {
		if (mousePressed == true) {
			fill(random(256),random(256),random(256));
		rect(mouseX,mouseY,mouseX+50,mouseY+50);
     if ((mouseX<4) || (mouseX > width-4) || (mouseY < 4) || (mouseY > height-4)) {
       mousePressed = false;
       println("wat!");
     }
		}

	}
