class PixSprite extends Sprite{

  float speed, radius, nextX, nextY, lifetime;
  double moveCounter, variability;
  ArrayList<FoodSprite> foodList;
  
  int speedPenalty = 4;
  
  
  int setLife , moveTime = 2; // for all starting conditions that i want to save
  int direction = 0;  // seperate because it isn't declared with constructor
  //final int JUMP = 5; //spaces moved per tick
  
  
  PixSprite(int life, float sp, float x, float y, double v, float r, ArrayList<FoodSprite> food){ //constuctor/////////////////////////////
    super(x, y);
    speed = sp;
    lifetime = life;
    setLife = life;
    moveCounter = moveTime;
    variability = v;
    radius = r;
    foodList = food;
  }
  
  int closestFood = 0;
  int closestPlox = 0;
  
  
  void spriteCycle(){ ////////////////////Cycle////////////////////
  
     nextY = yCoord;
     nextX = xCoord;
  
    if (lifetime > 0){
      fill(15*speed, 15*speed, (int)(25*speed)); //red = speed// //green = life// //blue = radius//
      circle(xCoord, yCoord, size); // draw sprite
      if (moveCounter < 0){
        
        closestPlox = findPlox(ploxSprites);
        closestFood = findFood(foodList);
        
        if(closestPlox != -1){ //<>//
          runFromPlox(closestPlox, ploxSprites);
          moveCounter = moveTime;
          lifetime-= 1 + speed / speedPenalty;
        } 
        
        else if(closestFood != -1){
          moveToClosest(closestFood, foodList);
          moveCounter = moveTime;
          lifetime-= 1 + speed / speedPenalty;
        } 
        
        else if (random(5) > variability){
          direction = (int)random(4);//assign direction
          moveInDirection(direction);//move
          moveCounter = moveTime;//reset speed
          lifetime-= 1 + speed / speedPenalty;
        }
        else{
          moveInDirection(direction);//move
          moveCounter = moveTime;//reset speed 
        }
        if(hitFoodSprite(xCoord, yCoord, foodList)){
          foodList.remove(whichSprite(xCoord, yCoord, foodList));
          lifetime += setLife/2;
          reproduce();
        }
        if(hitWallSprite(nextX, nextY, wallSprites)){
           xCoord -= (nextX - xCoord);
           yCoord -= (nextY - yCoord);
        }
        else{
          xCoord = nextX;
          yCoord = nextY;
        }
        
      }
      else{
        moveCounter--;
      }
    }
    else{
     pixSprites.remove(this); 
    }
  }
  
  void moveInDirection(int dir){  //Basic Movement Control/////////////////////////////////////////

    
    if(dir == 0){
      nextY = yCoord - speed;      
    }
    else if (dir == 1){
      nextX = xCoord + speed;
    }
    else if (dir == 2){
      nextY = yCoord + speed;
    }
    else{
      nextX = xCoord - speed; 
    }
    
  }
  
  boolean hitWallSprite(float x, float y, ArrayList<WallSprite> sprites){
    for(WallSprite s : sprites){
      float yCoordBottom = y + size, S_yCoordBottom = s.yCoord + s.wallHeight; 
      float xCoordRight = x + size, S_xCoordRight = s.xCoord + s.wallWidth; 
      
      if (y == s.yCoord && yCoordBottom >= S_yCoordBottom && x <= s.xCoord && xCoordRight >= S_xCoordRight){
        
        return true;
      }
      else if((y >= s.yCoord && y <= S_yCoordBottom || yCoordBottom >= s.yCoord && yCoordBottom <= S_yCoordBottom) 
                                                     && (x >= s.xCoord && x <= S_xCoordRight || xCoordRight >= s.xCoord && xCoordRight <= S_xCoordRight)){
          return true;
      }
    }
    return false;
  }

  boolean hitFoodSprite(float x, float y, ArrayList<FoodSprite> sprites){
    for(Sprite s : sprites){
      float yCoordBottom = y + size, S_yCoordBottom = s.yCoord + s.size; 
      float xCoordRight = x + size, S_xCoordRight = s.xCoord + s.size; 
      
      if (y == s.yCoord && yCoordBottom >= S_yCoordBottom && x <= s.xCoord && xCoordRight >= S_xCoordRight){
        
        return true;
      }
      else if((y >= s.yCoord && y <= S_yCoordBottom || yCoordBottom >= s.yCoord && yCoordBottom <= S_yCoordBottom) 
                                                     && (x >= s.xCoord && x <= S_xCoordRight || xCoordRight >= s.xCoord && xCoordRight <= S_xCoordRight)){
        {
          return true;
        }
      }
    }
    
    return false;
  }
  
  int whichSprite(float x, float y, ArrayList<FoodSprite> sprites){
    int i = 0;
    for(Sprite s : sprites){
      float yCoordBottom = y + size, S_yCoordBottom = s.yCoord + s.size; 
      float xCoordRight = x + size, S_xCoordRight = s.xCoord + s.size; 
      
      if((y >= s.yCoord && y <= S_yCoordBottom || yCoordBottom >= s.yCoord && yCoordBottom <= S_yCoordBottom) 
                                                && (x >= s.xCoord && x <= S_xCoordRight || xCoordRight >= s.xCoord && xCoordRight <= S_xCoordRight)){
          return i;
        
      }
      i++;
    }
    return -1;
  }
  
  void reproduce(){
   
    addNewPix(setLife + (int)random(-50,50), speed + random(-0.5,0.5), xCoord, yCoord, variability + random(-0.1 , 0.1), radius + random(-1, 1), foodList);
    
  }
  
  int findFood(ArrayList<FoodSprite> arr){
    //boolean isClosest = false;
    double closest = 100000; 
    int i;
    int point = 0;
    
    for(i = 0; i < arr.size(); i++){
      
      float xPoint = arr.get(i).xCoord;
      float yPoint = arr.get(i).yCoord;
      
      double distance = sqrt(pow(xCoord - xPoint, 2) + pow(yCoord - yPoint, 2));
      if (distance < closest){
        closest = distance;
        point = i;
        //println(point);
      }
 
    }
    if(closest < radius){
      //moveToClosest(point, arr);
      //println(point, closest);
      return point;
    }
    return -1;
  }
  
  void moveToClosest(int i, ArrayList<FoodSprite> arr){
    
    
    float xDist = arr.get(i).xCoord - xCoord;
    float yDist = arr.get(i).yCoord - yCoord;
    if(xDist != 0 && yDist != 0){
      float theta = atan(yDist/xDist);
      
      if(xDist > 0){
        nextX = xCoord + cos(theta)*speed;
        
      }
      else if(xDist < 0){
        nextX = xCoord - cos(theta)*speed;
        
      }
      
      if(yDist > 0){
        nextY = yCoord + abs(sin(theta)*speed);
        
      }
      else if(yDist < 0){
        nextY = yCoord - abs(sin(theta)*speed);
        
      }
      
      stroke(0);
      line(xCoord, yCoord, arr.get(i).xCoord, arr.get(i).yCoord);
     
    }
    else{
      if (yDist > 0){
        nextY = yCoord + speed;
      }
      else if (yDist < 0){
       nextY = yCoord - speed;
      }
      else if (xDist > 0){
        nextX = xCoord + speed;
      }
      else if (xDist < 0){
        nextX = xCoord - speed;
      }
    }
  }
  
  int findPlox(ArrayList<PloxSprite> arr){
    //boolean isClosest = false;
    double closest = 100000; 
    int i;
    int point = 0;
    
    for(i = 0; i < arr.size(); i++){
      
      float xPoint = arr.get(i).xCoord;
      float yPoint = arr.get(i).yCoord;
      
      double distance = sqrt(pow(xCoord - xPoint, 2) + pow(yCoord - yPoint, 2));
      if (distance < closest){
        closest = distance;
        point = i;
        //println(point);
      }
 
    }
    if(closest < radius){
      return point;
    }
    return -1;
  }
  
  void runFromPlox(int i, ArrayList<PloxSprite> arr){
    
    
    float xDist = arr.get(i).xCoord - xCoord;
    float yDist = arr.get(i).yCoord - yCoord;
    if(xDist != 0 && yDist != 0){
      float theta = atan(yDist/xDist);
      
      if(xDist > 0){
        nextX = xCoord - cos(theta)*speed;
        
      }
      else if(xDist < 0){
        nextX = xCoord + cos(theta)*speed;
        
      }
      
      if(yDist > 0){
        nextY = yCoord - abs(sin(theta)*speed);
        
      }
      else if(yDist < 0){
        nextY = yCoord + abs(sin(theta)*speed);
        
      }
      
      stroke(0);
      line(xCoord, yCoord, arr.get(i).xCoord, arr.get(i).yCoord);
     
    }
    else{
      if (yDist > 0){
        nextY = yCoord + speed;
      }
      else if (yDist < 0){
       nextY = yCoord - speed;
      }
      else if (xDist > 0){
        nextX = xCoord + speed;
      }
      else if (xDist < 0){
        nextX = xCoord - speed;
      }
    }
  }
  
  
}
