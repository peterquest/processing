int circleRadius = 50;
int xSpeed = 9; //making these speeds different makes for
int ySpeed = 5; // a wackier path. high speeds are fun!
int x = circleRadius+100;
int y = circleRadius;
int p1Score, p2Score;
int p1PaddlePos = 200;
int p2PaddlePos = 350;
int paddleHeight = circleRadius*2;
int paddleWidth = 15;

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
                       (y < p2PaddlePos+paddleHeight+circleRadius/2)) {
                   xSpeed = -xSpeed;
                      }
             }
        
        if ((leftEdge < paddleWidth) && (x > paddleWidth)) {
             if ((p1PaddlePos-circleRadius < y) && 
                        (y < p1PaddlePos+paddleHeight+circleRadius/2)) {
                    xSpeed = -xSpeed;
                       }
              }
         
         /* HITS ALL WALLS
          *  if ((rightEdge >= width) || (leftEdge <= 0)) {
          *    xSpeed = -xSpeed;
          *    }
          *    */
         if ((bottomEdge >= height) || (topEdge <=0)) {
             ySpeed = -ySpeed;
              }
          
          
}


void drawBackground() {
   fill(120,0,10,50);
    rect(0,0,width,height);
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
        rect(0, p1PaddlePos, paddleWidth, paddleHeight);
          rect(width-paddleWidth, p2PaddlePos, paddleWidth, paddleHeight);
            
}

void gameOver(int winner){
   // wait for mouseclick
   //text("player " + winner + " wins!", 300,300, 100,100);
   // on mouseclick: restart();
   //   }
   //
   //   void updatePaddles() {
   //getKeyboardIn()
   //drawPaddles()
   //       }
   //
void updateScore() {
//if ball.x > width p1++
//          < 0     p2++
// if p2>7 && p2>p1+1, gameOver(1);
// 

}
