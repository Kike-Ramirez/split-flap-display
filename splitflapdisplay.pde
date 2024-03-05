/**
 * SplitFlapDisplay
 *
 * Sketch implementing a display made of splitflapletters.
 *
 */


SplitFlapLetter letterlist;
int num = 32;

void setup() {
  size(1280, 720, P3D);
  smooth();
  hint(DISABLE_DEPTH_MASK);
  letterlist = new SplitFlapLetter();
  textSize(30);
}


void draw() {

  background(80);
  letterlist.update();
  letterlist.displayDigit(20, int(0.15 * height));

  textAlign(LEFT, CENTER);
  text(int(frameRate) + " - " + ((num - 32) % (127-32)), 20, 50);
}

void keyPressed() {
  letterlist.setPositionTargetChar(key);
}
