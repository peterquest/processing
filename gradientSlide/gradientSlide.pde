
void setup() {
	colorMode(HSB, 360,100,100);
	size(1000,1000);
	}


	void draw() {
		background(360-(mouseY/(2.7777)), 100,100-(mouseX/10));
	}
