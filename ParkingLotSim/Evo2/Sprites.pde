class Sprite{
  
  float xCoord, yCoord;
  int size = 5;
  
  Sprite( float x, float y){ // duh

    xCoord = x;
    yCoord = y;

  }
  
  
  void spriteCycle(){
    circle(xCoord, yCoord, size);
  }
 
  
  
  
  
  
  
  
  
}
