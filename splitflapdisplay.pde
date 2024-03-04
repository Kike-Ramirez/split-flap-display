/**
 * Inheritance
 *
 * A class can be defined using another class as a foundation. In object-oriented
 * programming terminology, one class can inherit fi elds and methods from another.
 * An object that inherits from another is called a subclass, and the object it
 * inherits from is called a superclass. A subclass extends the superclass.
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
  //dg1.update();
  //dg1.display();
  //dg2.update();
  //dg2.display();
  letterlist.printDigitInt(num, 20, int(0.15 * height));
  textAlign(LEFT, CENTER);
  text(int(frameRate) + " - " + ((num - 32) % (127-32)), 20, 50);
  if (frameCount % 10 == 0) num++;
}
