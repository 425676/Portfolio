// Max Elkin | 25 Sept 2025 | Calculator Project
Button[] buttons  = new Button[12];
Button[] numButtons = new Button[10];
float l, r, result;
boolean left;
String dVal;
char op;

void setup() {
  size(270, 140);
  background(#466FFF);
  left = true;
  l = 0;
  r = 0;
  result = 0;
  dVal = "0";
  op = ' ';
  numButtons[0] = new Button(30, 113, 20, 35, '0', #5AB3FF, #4D9ADB, false);
  buttons[0] = new Button(30, 67, 20, 35, 'C', #FFFFFF, #B7B3B3, false);
  buttons[1] = new Button(180, 90, 20, 20, '±', #FFFFFF, #B7B3B3, false);
  buttons[2] = new Button(240, 75, 20, 50, '=', #FFFFFF, #B7B3B3, false);
  numButtons[1] = new Button(60, 120, 20, 20, '1', #5AB3FF, #4D9ADB, true);
  numButtons[2] = new Button(90, 120, 20, 20, '2', #5AB3FF, #4D9ADB, true);
  numButtons[3] = new Button(120, 120, 20, 20, '3', #5AB3FF, #4D9ADB, true);
  numButtons[4] = new Button(60, 90, 20, 20, '4', #5AB3FF, #4D9ADB, true);
  numButtons[5] = new Button(90, 90, 20, 20, '5', #5AB3FF, #4D9ADB, true);
  numButtons[6] = new Button(120, 90, 20, 20, '6', #5AB3FF, #4D9ADB, true);
  numButtons[7] = new Button(60, 60, 20, 20, '7', #5AB3FF, #4D9ADB, true);
  numButtons[8] = new Button(90, 60, 20, 20, '8', #5AB3FF, #4D9ADB, true);
  numButtons[9] = new Button(120, 60, 20, 20, '9', #5AB3FF, #4D9ADB, true);
  buttons[3] = new Button(150, 60, 20, 20, '+', #FFFFFF, #B7B3B3, true);
  buttons[4] = new Button(150, 90, 20, 20, '-', #FFFFFF, #B7B3B3, true);
  buttons[5] = new Button(150, 120, 20, 20, '*', #FFFFFF, #B7B3B3, true);
  buttons[6] = new Button(180, 60, 20, 20, '÷', #FFFFFF, #B7B3B3, true);
  buttons[7]= new Button(180, 120, 20, 20, '.', #FFFFFF, #B7B3B3, true);
  buttons[8] = new Button(210, 120, 20, 20, '√', #FFFFFF, #B7B3B3, true);
  buttons[9] = new Button(210, 90, 20, 20, '²', #FFFFFF, #B7B3B3, true);
  buttons[10] = new Button(210, 60, 20, 20, 'π', #FFFFFF, #B7B3B3, true);
  buttons[11] = new Button(240, 120, 20, 20, '%', #FFFFFF, #B7B3B3, true);
}

void draw() {
  background(#466FFF);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  // Not number buttons
  for (int i = 0; i<buttons.length; i++) {
    if (buttons [i].over && buttons [i].val == '+') {
      dVal = "0";
      left = false;
      op = '+';
    } else if (buttons [i].over && buttons [i].val == '=') {
      performCalculation();
    } else if (buttons [i].over && buttons[i].val == '.') {
      if (dVal.contains(".") == false) {
        dVal += '.';
      }
    } else if (buttons [i].over && buttons [i].val == '²') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == '±') {
      if (left) {
        l*=-1;
        dVal = str(l);
      } else {
        r*=-r;
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == '-') {
      dVal = "0";
      left = false;
      op = '-';
    } else if (buttons [i].over && buttons [i].val == '*') {
      dVal = "0";
      left = false;
      op = '*';
    } else if (buttons [i].over && buttons [i].val == '÷') {
      dVal = "0";
      left = false;
      op = '/';
    } else if (buttons [i].over && buttons [i].val == 'C') {
      left = true;
      l = 0;
      r = 0;
      result = 0;
      dVal = "0";
      op = ' ';
    } else if (buttons [i].over && buttons [i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    }
  }
  // All number buttons
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<23) {
      if (numButtons[i].over && left == true) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && !left) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }
  //for (int i = 0; i<buttons.length; i++) {
  //   if (buttons[i].over) {
  //     if (dVal.equals("0")) {
  //       dVal = str(buttons[i].val);
  //     } else {
  //       dVal += str(buttons[i].val);
  //     }
  //   }
  // }
  println("L:"+l);
  println("R:"+r);
  println("Result:"+ result);
  println("Op:"+op);
  println("Left:"+left);
}

void updateDisplay() {
  fill(255);
  rectMode(CORNER);
  rect(10, 10, 250, 30, 5);
  fill(0);
  textSize(25);
  textAlign(RIGHT);
  if (dVal.length()>15) {
    textSize(21);
  }
  text(dVal, width-15, 35 );
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
}
