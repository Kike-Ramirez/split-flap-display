class Digit {
  PFont f;
  String message = "this text is spinning";
  float x, y, w, h, angle;
  Digit(float xpos, float ypos, float wpos, float hpos) {
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    angle = 0;
    f = createFont("Arial", 30);
    textFont(f, 30);
    textAlign(CENTER,CENTER);
    rectMode(CENTER);
  }
  void update() {
    angle += 0.01;
  }
}

class Digit1 extends Digit {
  Digit1(float x, float y, float w, float h) {
    super(x, y, w, h);
    angle = 0; 
    message = "Message 1";
  }
  void display() {
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(x, y);
    rotateX(angle);
    fill(0);
    rect(0, 0, 200, 60);
    fill(255);
    text(message, 0, 0); 
    popMatrix();
  }
}

class Digit2 extends Digit {
  Digit2(float x, float y, float w, float h) {
    super(x, y, w, h);
    message = "Message 2";
  }
  void display() {
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(x, y);
    rotateX(angle);
    fill(0);
    rect(0, 0, 200, 60);
    fill(255);
    text(message, 0, 0); 
    popMatrix();
  }
}
