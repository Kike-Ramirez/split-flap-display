class SplitFlapLetter {

  ArrayList<PGraphics> pg_list = new ArrayList<PGraphics>();
  PFont f;

  SplitFlapLetter() {
    f = createFont("Arial", 30);
    
    for (int i = 32; i < 127; i++) {
      println(char(i));
      PGraphics canvas = createGraphics(200, 400);
      canvas.beginDraw();
      canvas.background(0);
      canvas.fill(255);
      canvas.textAlign(CENTER, CENTER);
      canvas.textFont(f, 250);
      canvas.text(char(i), 0.5 * canvas.width, 0.5 * canvas.height);
      canvas.endDraw();
      pg_list.add(canvas);
    
    }
  }
  
  PGraphics getLetter(int i) {
    return pg_list.get(i);
  }
}
