class WallSprite extends Sprite{

  int wallWidth, wallHeight;
  WallSprite(float x, float y, int ww, int wh){
    
    super(x,y);

    wallWidth = ww;
    wallHeight = wh;
    
  }
  
  
  void spriteCycle(){
    
    noStroke();
    fill(0);
    rect(xCoord, yCoord, wallWidth, wallHeight);
    stroke(0);
  }
  
}
