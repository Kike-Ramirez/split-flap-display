class SplitFlapLetter {

  ArrayList<PImage[]> digit_list = new ArrayList<PImage[]>();

  int fontSize = 250;
  PFont font = createFont("Helvetica.ttf", fontSize);
  int heightCard = 350;
  int widthCard = 250;
  color bgColor = color(0);
  color fontColor = color(255);
  color strokeColor = color(0);
  int strokeWeight = 0;
  color dividerColor = color(255, 0, 0);
  int dividerWeight = 2;

  int positionNow = 32;
  int positionTarget = 32;
  int flapFrameCount = 6;
  int flapCount = 0;

  SplitFlapLetter() {
    createList();
  }

  void update() {
    if (positionNow != positionTarget) {
      flapCount++;
      if (flapCount >= flapFrameCount) {
        flapCount = 0;
        positionNow++;
        if (positionNow > 127) {
          positionNow = 32;
        }
      }
    }
  }

  void setFlapFrameCount(int i) {
    flapFrameCount = i;
  }
  void setPositionTargetInt(int i) {
    positionTarget = (i - 32) % (127-32);
  }

  void setPositionTargetChar(char c) {
    positionTarget = int(c);
  }

  void increasePositionTarget() {
    positionTarget++;

    if (positionTarget > 127) {
      positionTarget = 0;
    }
  }

  void setSize(int w, int h, boolean recreate) {
    if (h == 0) {
      widthCard = w;
      heightCard = int(1.4 * w);
    } else {
      widthCard = w;
      heightCard = h;
    }

    if (recreate) {
      createList();
    }
  }

  void setFontSize(int fs, boolean recreate) {
    fontSize = fs;
    if (recreate) {
      createList();
    }
  }

  void setFont(PFont f, boolean recreate) {
    font = f;
    if (recreate) {
      createList();
    }
  }

  void setBackgroundColor(color bgc, boolean recreate) {
    bgColor = bgc;
    if (recreate) {
      createList();
    }
  }

  void setFontColor(color fc, boolean recreate) {
    fontColor = fc;
    if (recreate) {
      createList();
    }
  }

  void setDividerColor(color dc, boolean recreate) {
    dividerColor = dc;
    if (recreate) {
      createList();
    }
  }

  void setDividerWeight(int dw, boolean recreate) {
    dividerWeight = dw;
    if (recreate) {
      createList();
    }
  }

  void setStrokeColor(color sc, boolean recreate) {
    strokeColor = sc;
    if (recreate) {
      createList();
    }
  }

  void setStrokeWeight(int sw, boolean recreate) {
    strokeWeight = sw;
    if (recreate) {
      createList();
    }
  }


  void createList() {
    digit_list.clear();
    for (int i = 32; i < 127; i++) {
      PGraphics canvas = createGraphics(widthCard, heightCard);
      canvas.beginDraw();
      // Background
      canvas.background(bgColor);

      // Outer Stroke Lines
      if (strokeWeight > 0) {
        canvas.noFill();
        canvas.stroke(strokeColor);
        canvas.strokeWeight(strokeWeight);
        canvas.rect(0, 0, canvas.width-1, canvas.height-1);
      }


      // Divider Line
      if (dividerWeight > 0) {
        canvas.stroke(dividerColor);
        canvas.strokeWeight(dividerWeight);
        canvas.line(0, 0.5 * canvas.height, canvas.width, 0.5 * canvas.height);
      }

      // Char Text
      canvas.fill(fontColor);
      canvas.noStroke();
      canvas.textAlign(CENTER, CENTER);
      canvas.textFont(font, fontSize);
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

  void printDigitInt(int i, int x, int y) {
    PImage[] digit = getPos(i);

    pushMatrix();
    translate(x, y);
    image(digit[1], 0, 0);
    popMatrix();

    pushMatrix();
    translate(x, y + digit[1].height);
    image(digit[0], 0, 0);
    popMatrix();
  }

  void printDigitChar(char c, int x, int y) {
    PImage[] digit = getChar(c);

    pushMatrix();
    translate(x, y);
    image(digit[1], 0, 0);
    popMatrix();

    pushMatrix();
    translate(x, y + digit[1].height);
    image(digit[0], 0, 0);
    popMatrix();
  }
  
  void displayDigit(int x, int y) {
    printDigitInt(positionNow, x, y);
  }
}
