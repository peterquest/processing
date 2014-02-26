int circleRadius = 25; 
int xSpeed = 9; //making these speeds different makes for
int ySpeed = 5; // a wackier path. high speeds are fun!
int x = circleRadius+100;
int y = circleRadius;
int p1Score = 0;
int p2Score = 0;
int p1PaddlePos = 250;
int p2PaddlePos = 250;
int paddleHeight = circleRadius*4;
int paddleWidth = 20;
int bounceMarker; // THIS FEELS WEIRD AND HACKY.
int result; //this is just getting ugly now.
String lastWinner = "";
boolean p1up, p1down, p2up, p2down;
boolean started;

void setup() {
   size(800,600);
   startScreen();
}

void draw() {
  startGame();
  if (!started) return;

  drawBackground();
  drawPaddles();
  updateBall();
  checkScore();
}


void checkScore() {
  textSize(60);
  fill(255);
  text(p1Score, width/4, 50);
  text(p2Score, 3*width/4, 50);
  if ((p1Score > 6) && (p1Score > p2Score+1)) gameOver(1);
  if ((p2Score > 6) && (p2Score > p1Score+1)) gameOver(2);
}


void detectPaddles(int x, int y) {
    
   int rightEdge = x + circleRadius;
   int leftEdge = x - circleRadius;
   int topEdge = y - circleRadius;
   int bottomEdge = y + circleRadius;

   if ((rightEdge>width-paddleWidth) && (x < width-paddleWidth)) {
    if ((p2PaddlePos-circleRadius < y) && 
        (y < p2PaddlePos+paddleHeight+circleRadius/2) &&
        (frameCount > bounceMarker + 10))  { //1 bounce per 10 frames
               
         xSpeed = -xSpeed;
         bounceMarker = frameCount;
          }
   }
        
   if ((leftEdge < paddleWidth) && (x > paddleWidth)) {
    if ((p1PaddlePos-circleRadius < y) && 
        (y < p1PaddlePos+paddleHeight+circleRadius/2) &&
        (frameCount > bounceMarker + 10)) {

         xSpeed = -xSpeed;    
         bounceMarker = frameCount;
    }
   }
         
    if ((bottomEdge >= height) || (topEdge <=0)) {
    
      ySpeed = -ySpeed;  
    }
}


void drawBackground() {
   fill(120,0,10,50);
   rect(0,0,width,height);
   stroke(255);
   strokeWeight(5);
   line(width/2,0,width/2,height);
   noStroke();
}

void keyPressed () {
 
  if (key == 'q') p1up = true;
  if (key == 'a') p1down = true;
  if (key == 'p') p2up = true;
  if (key == 'l') p2down = true;

}

void keyReleased () {
 
  if (key == 'q') p1up = false;
  if (key == 'a') p1down = false;
  if (key == 'p') p2up = false;
  if (key == 'l') p2down = false;

}


void updateBall() {
   x+=xSpeed;
   y+=ySpeed;
   result = scored(x);
   if (result != 0) {
     if (result == 1) {
       p1Score++;
       x = width-circleRadius*4;
       y = 100;
       xSpeed = -xSpeed;
     }
     if (result == 2) {
       p2Score++;
       x = circleRadius*4;
       y = 100;
       xSpeed = -xSpeed;
     }
   }
   
   fill(255);
   ellipse(x,y,circleRadius*2,circleRadius*2);
   detectPaddles(x,y);
}

void drawPaddles() {
  updatePaddles();
  fill(255);
  rect(3, p1PaddlePos, paddleWidth-3, paddleHeight);
  rect(width-paddleWidth, p2PaddlePos, paddleWidth-3, paddleHeight);
            
}

void gameOver(int winner){
 started = false;
 p1Score = 0;
 p2Score = 0;
 lastWinner = "player " + winner + " ";
 startScreen();
}

int scored(int x) {
  if (x > width+circleRadius*4) return 1;
  if (x < 0-circleRadius*4) return 2;
  else return 0;
}

void startGame() {
  if (mousePressed) started = true;
}

void startScreen() {
  background(100);
  fill(150,0,50,255);
  textSize(48);
  text("PONGER.", 50,50);
  textSize(32);
  text("Q and A control p1, P and L control p2.", 150,100);
  text("Click to start!", 200, 150); 
  if (lastWinner != "") {
    textSize(60);
    fill(0,50,200,255);
    text(lastWinner + "won the last round. Play again!", 150,200, 300,300);
 }
}

void updatePaddles() {
  if (p1PaddlePos > 0){ if (p1up) p1PaddlePos -= 5;}
  if (p1PaddlePos+paddleHeight < height){if (p1down) p1PaddlePos += 5;}
  if (p2PaddlePos > 0){if (p2up) p2PaddlePos -= 5;}
  if (p2PaddlePos+paddleHeight< height){if (p2down) p2PaddlePos += 5;}
}



