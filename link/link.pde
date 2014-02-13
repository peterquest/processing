// @pjs preload must be used to preload the image 

    /* @pjs preload="linklarge.png"; */
 
float pixelSize = 400/13.0;
PImage link; 

void setup () {
link = loadImage("linklarge.png");
size(link.width, link.height);
background(link);
}

void draw () {


}
