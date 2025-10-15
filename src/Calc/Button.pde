class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  boolean over, isDiam;
  color c1, c2;

  // Constructer
  Button(int x, int y, int w, int h, char val, color c1, color c2, boolean isDiam) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    over = false;
    this.c1 = c1;
    this.c2 = c2;
  }

  // Member Methods
  void display() {
    // Rectangle Properties
    rectMode(CENTER);
    if (over == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    strokeWeight(2);
    stroke(55);
    if (isDiam == true) {
      quad(x, y-10, x+10, y, x, y+10, x-10, y);
    } else {
      rect(x, y, w, h);
      
    // Text Properties
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(val, x, y);
  }
}
void hover(int tempX, int tempY) {
  if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2) {
    over = true;
  } else {
    over = false;
    }
  }
}
