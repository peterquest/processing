int circleRadius = 30;
int xSpeed = 9; //making these speeds different makes for
int ySpeed = 5; // a wackier path. high speeds are fun!
int x = circleRadius+100;
int y = circleRadius;
int p1Score, p2Score;
int p1PaddlePos = 270;
int p2PaddlePos = 350;
int paddleHeight = circleRadius*3;
int paddleWidth = 20;
int bounceMarker; // THIS IS WEIRD AND HACKY.
boolean p1up, p1down, p2up, p2down;

void setup() {
   size(800,600);
}

void draw() {
   drawBackground();
   drawPaddles();
   updateBall();
   updateScore();
       

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
/*
void gameOver(int winner){
   // wait for mouseclick
   //text("player " + winner + " wins!", 300,300, 100,100);
   // on mouseclick: restart();
   //   }
   */
void updatePaddles() {
   if (p1up) p1PaddlePos -= 5;
   if (p1down) p1PaddlePos += 5;
   if (p2up) p2PaddlePos -= 5;
   if (p2down) p2PaddlePos += 5;
        }

void updateScore() {
//if ball.x > width p1++
//          < 0     p2++
// if p2>7 && p2>p1+1, gameOver(1);
// 

}
