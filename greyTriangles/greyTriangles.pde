void setup() { 
  size(800,500);
}

void draw() {
  fill(random(255));
  triangle(random(800),random(500),random(800),random(500),random(width),random(height));

}
