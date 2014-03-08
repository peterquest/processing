// bubbleMotion
// peter lynn

// NOTE! THIS VERSION IS BUILT SPECIFICALLY FOR
// VERSION 1.5.1, IT WILL NOT WORK WITH OTHER VERSIONS.

// adapted from:
// Example 16-13: Simple motion detection
// Daniel Shiffman
// http://www.learningprocessing.com

import fullscreen.*;
import processing.video.*;
FullScreen fs;
Capture video;
PImage baseFrame;
// How different must a pixel be to be a "motion" pixel
float threshold = 40;
int sampleWidth = 160; //resolution of our motion sample.
int sampleHeight = 120;
int totalPixels = sampleWidth * sampleHeight; //calculate once!
boolean[] motionPixels = new boolean[totalPixels];
final int bubWidth = 30;
int bubHeight = bubWidth;
int bubDur = 8;
float wind = 0.5;
float mappedX, mappedY;
ArrayList bubbles = new ArrayList();

void setup() {
  size(1280,720);
  frameRate(24);
  noStroke();
  video = new Capture(this, sampleWidth, sampleHeight, 30);
  // Create an empty image the same size as the video
  baseFrame = createImage(video.width,video.height,RGB);
//  video.start();
  fs = new FullScreen(this);
  fs.enter();
}

void draw() {

  getMotion();
  image(baseFrame,0,0,width,height);
  bubbleMotion();
  drawBubbles();
 }

class Bubble {

  float x;
  float y;
  float direction; // -1 to 1
  int speed; // number of pixels to rise per frame
  int duration; // number of frames to last (set by bubDur)
  color c;

  Bubble (float x, float y, float dir, int sp, int dur, color c) {
    this.x = x;
    this.y = y;
    this.direction = dir;
    this.speed = sp;
    this.duration = dur;
    this.c = c;
  }

  void drawBubble() {
    c = updateColor(c);
    fill(c,duration*50);
    ellipse(x,y,bubWidth,bubHeight);
    updateBubble();
  }

  void updateBubble() {
    y-= speed; //always moving up at constant rate
    x += (direction*5);
//    direction -= direction/bubDur;
    direction += wind;
    duration--;
  }
}

class Point { //rolled my own Point class.
  float x;
  float y;

  Point(float x, float y) {
   this.x = x;
   this.y = y;
  }
}

void drawBubbles() {
  for (int i=0; i<bubbles.size(); i++) {
    Bubble b = (Bubble) bubbles.get(i);
    if (b.duration == 0) bubbles.remove(i);
    else b.drawBubble();
  }
}


void bubbleMotion() {
  int offset = frameCount%(bubWidth/4);
  for (int i=offset; i<totalPixels; i=i+bubWidth-(bubWidth/5)) {
    if (motionPixels[i]) {
            
      Point p = index2loc(i);
      mappedX = map(p.x, 0, sampleWidth, 0, width);
      mappedY = map(p.y, 0, sampleHeight, 0, height);

      if(bubbles.size() < 4500) {
      bubbles.add(new Bubble(mappedX,mappedY,random(-1,1),
                             int(random(3,6)),bubDur, video.pixels[i]));
          }
//      i+=5;
       }
    }

}



void getMotion() {
  video.read(); //grab video frame
  video.loadPixels(); //loads pixels into video.pixels[]
  baseFrame.loadPixels();// same for baseFrame
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      // Step 1, what is the 1D pixel location
      int loc = x + y*video.width;
      // Step 2, what is the current color
      color current = video.pixels[loc];
      // Step 3, what is the previous color
      color previous = baseFrame.pixels[loc];
      // Step 4, compare colors (previous vs. current)
      float r1 = red(current);
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(previous);
      float g2 = green(previous);
      float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion
      // at that pixel.
      if (diff > threshold) {
        // If motion, mark a spot
        motionPixels[loc] = true;
      } else {
        // If not, don't mark.
        motionPixels[loc] = false;
      }
    }
  }
}
//convert pixel[] index into x,y
Point index2loc (int i) {
  int x = i%sampleWidth; 
  int y = i/sampleHeight;

  Point p = new Point(x,y);
  return p;
}

void mousePressed() {
    setBaseImage();
}

void setBaseImage() {
    baseFrame.copy(video,0,0,video.width,video.height,0,0,
                   video.width,video.height);
    baseFrame.updatePixels();
}

color updateColor (color c) {
 
  // DO SOMETHING TO THE COLOR BASED ON ARDUINO INPUT
 
  return c;
}
