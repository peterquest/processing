void setup() {
	background(50);
	size(1000,1000);
	}

	void draw() {
		for (int i=0;i<1000;i++) {
			stroke(random(256),random(256),random(256));
			line(i%1000,random(1000),mouseX,mouseY);
			}
	}
