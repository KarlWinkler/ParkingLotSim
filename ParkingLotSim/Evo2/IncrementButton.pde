class IncrementButton extends Button {

  int spacing;
  String name1, name2;

  IncrementButton(String n1, String n2, int x, int y, int bW, int bH, int ts, int s) {

    super(n1, x, y, bW, bH, ts);
    spacing = s;
    name1 = n1;
    name2 = n2;
  }


  void drawButton() {

    stroke(0);
    
    if (isPressedLeft()) {
      fill(255, 0, 0);
      rect(x, y, buttonWidth, buttonHeight);
      fill(0);
      rect(x + (spacing + buttonWidth), y, buttonWidth, buttonHeight);
    }
    else if (isPressedRight()) {
      fill(0);
      rect(x, y, buttonWidth, buttonHeight);
      fill(255, 0, 0);
      rect(x + (spacing + buttonWidth), y, buttonWidth, buttonHeight);
    }
    else if(isHoverLeft()){
      fill(100);
      rect(x, y, buttonWidth, buttonHeight);
      fill(0);
      rect(x + (spacing + buttonWidth), y, buttonWidth, buttonHeight);
    }
    else if(isHoverRight()){
      fill(0);
      rect(x, y, buttonWidth, buttonHeight);
      fill(100);
      rect(x + (spacing + buttonWidth), y, buttonWidth, buttonHeight);
    } 
    else {
      fill(0);
      rect(x, y, buttonWidth, buttonHeight);
      fill(0);
      rect(x + (spacing + buttonWidth), y, buttonWidth, buttonHeight);
    }


    fill(255);
    text(name1, x + (buttonWidth/2) - (name1.length()/2.0) * textSize, y + (buttonHeight/2 + textSize));
    text(name2, x + (buttonWidth/2) - (name2.length()/2.0) * textSize + (spacing + buttonWidth), y + (buttonHeight/2 + textSize));
  }

  boolean isPressedLeft() {

    if (mousePressed && mouseButton == LEFT && isHoverLeft()) {
      return true;
    }

    return false;
  }

  boolean isPressedRight() {

    if (mousePressed && mouseButton == LEFT && isHoverRight()) {
      return true;
    }

    return false;
  }

  boolean isHoverLeft() {

    if (mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight) { 

      return true;
    }

    return false;
  }

  boolean isHoverRight() {

    if (mouseX >= x + (spacing + buttonWidth) && mouseX <= x + buttonWidth + (spacing + buttonWidth) && mouseY >= y && mouseY <= y + buttonHeight) { 

      return true;
    }

    return false;
  }
}
