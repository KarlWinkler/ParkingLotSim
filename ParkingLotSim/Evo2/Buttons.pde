class Button{
 
  String name;
  int x, y, buttonWidth, buttonHeight, textSize;
  
  Button(String n, int x, int y, int bW, int bH, int ts){
    name = n;
    this.x = x;
    this.y = y;
    buttonWidth = bW;
    buttonHeight = bH;
    textSize = ts/2;
  }
  
  void drawButton(){
    stroke(0);
    fill(0);
    if(isHover()){
      fill(100);
    }
    if (isPressed()){
      fill(255,0,0);
    }
    rect(x, y, buttonWidth, buttonHeight);
    fill(255);
    text(name, x + (buttonWidth/2) - (name.length()/2.0) * textSize, y + (buttonHeight/2 + textSize));
    
  }
  
  boolean isPressed(){
    
    if(mousePressed && mouseButton == LEFT && isHover()){
      
      return true;
      
    }
    
    return false;
    
  }
  
  boolean isHover(){
     
     if(mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight){ 
                                                     
          return true;
      }
    
    return false;
  }
  
}
