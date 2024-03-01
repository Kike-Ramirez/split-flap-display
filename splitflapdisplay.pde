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
int num = 32;

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
  //dg1.update();
  //dg1.display();
  //dg2.update();
  //dg2.display();
  image(letterlist.getPos(num)[1], 20, 0.1 * height);
  image(letterlist.getPos(num)[1], 280, 0.1 * height);
  image(letterlist.getPos(num)[1], 540, 0.1 * height);  
  image(letterlist.getPos(num)[0], 20, 176 + 0.1 * height);
  image(letterlist.getPos(num)[0], 280, 176 + 0.1 * height);
  image(letterlist.getPos(num)[0], 540, 176 + 0.1 * height);
  text(int(frameRate) + " - " + num, 50, 20);
  if (frameCount % 30 == 0) num++;
}
