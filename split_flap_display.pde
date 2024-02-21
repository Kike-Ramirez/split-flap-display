/**
 * Inheritance
 * 
 * A class can be defined using another class as a foundation. In object-oriented
 * programming terminology, one class can inherit fi elds and methods from another. 
 * An object that inherits from another is called a subclass, and the object it 
 * inherits from is called a superclass. A subclass extends the superclass.
 */

Digit1 dg1;
Digit2 dg2;
SplitFlapLetter letterlist;

void setup() {
  size(1280, 720, P3D);
  smooth();
  hint(DISABLE_DEPTH_MASK);
  letterlist = new SplitFlapLetter();
  dg1 = new Digit1(0.333 * width, 0.5 * height, 200, 300);
  dg2 = new Digit2(0.66 * width, 0.5 * height, 200, 300);
}

void draw() {
  background(100);
  dg1.update();
  dg1.display();
  dg2.update();
  dg2.display();
  image(letterlist.getLetter(65-32), 0, 0);
  image(letterlist.getLetter(66-32), 200, 0);
  image(letterlist.getLetter(67-32), 400, 0);
}
