class SplitFlapLetter {

  ArrayList<PImage[]> digit_list = new ArrayList<PImage[]>();  
  PFont f;
  int heightChar = 250;

  SplitFlapLetter() {
    f = createFont("Arial", 30);
    
    for (int i = 32; i < 127; i++) {
      println(char(i));
      PGraphics canvas = createGraphics(int(1.0 * heightChar), int(1.4 * heightChar));
      canvas.beginDraw();
      canvas.background(0);
      canvas.fill(255);
      canvas.textAlign(CENTER, CENTER);
      canvas.textFont(f, heightChar);
      canvas.text(char(i), 0.5 * canvas.width, 0.5 * canvas.height);
      canvas.endDraw();
      PImage[] digitSet = {canvas.get(0, int(0.5 * canvas.height), canvas.width, int(0.5 * canvas.height)), canvas.get(0, 0, canvas.width, int(0.5 * canvas.height))};
      digit_list.add(digitSet);
    
    }
  }
  
  ArrayList<PImage[]> getList() {
    return digit_list;
  };
  
  PImage[] getChar(char c) {
    int i = int(c) - 32;
    PImage[] digit = digit_list.get(i);
    return digit;
  }

  PImage[] getPos(int i) {
    int num = (i - 32) % (127-32);
    PImage[] digit = digit_list.get(num);
    return digit;
  }  
  
}
