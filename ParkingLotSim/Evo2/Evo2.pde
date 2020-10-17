//Sprite s = new Sprite(1000, 5, 400,400, .5);
ArrayList<WallSprite> wallSprites = new ArrayList<WallSprite>(0);
ArrayList<FoodSprite> foodSprites = new ArrayList<FoodSprite>(0);
ArrayList<PixSprite> pixSprites = new ArrayList<PixSprite>(0);
ArrayList<PloxSprite> ploxSprites = new ArrayList<PloxSprite>(0);
ArrayList<OmniSprite> omniSprites = new ArrayList<OmniSprite>(0);
int counter = 100;
int foods;

Table table;

ScreenSelector sS = new ScreenSelector(0);

void setup(){

  size(800,800);
  table= new Table();
  makeBox(width+190, height + 190, 200, -195, -195);
  

    
  table.addColumn("PixPopulation"); 
  table.addColumn("PixSpeed");  
  table.addColumn("PixVariance");
  table.addColumn("PixRadius");
  table.addColumn("PixLife");
  
  table.addColumn("PloxPopulation");
  table.addColumn("PloxSpeed");  
  table.addColumn("PloxVariance");
  table.addColumn("PloxRadius");
  table.addColumn("PloxLife");

}

void draw(){
  
  
  
  sS.drawCurrentScreen();
  

}

void mousePressed(){
  
  if (mouseButton == RIGHT){ // switch between stats and evoScreen /// 
    if(sS.screen == 1){
      sS.screen = 2;
    }
    else if(sS.screen == 2){
     sS.screen = 1; 
    }
  }
  
  //if (mouseButton == LEFT){ /// This will be moved to buttons later /// //////////////////is now buttons now :)
  //  if(sS.screen == 0){
  //    sS.screen = 1;
  //  }
  //  else if(sS.screen == 2){
  //   sS.screen = 0; 
  //  }
  //}
  
}

void drawBackground(){
  stroke(0,0,0,50);
  for(float i = -2.5; i < height; i+=5){
    
    line(0,i,width,i);
    
  }
  for(float i = -2.5; i < width; i+=5){
    
    line(i,0,i,height);
    
  }
  stroke(0);

}

void buildWorld(){
 for(Sprite s : wallSprites){
   fill(255);
   s.spriteCycle();
 }
 for(Sprite f : foodSprites){
   fill(255,255,0);
   f.spriteCycle();
   fill(255);
 }
 for(int i = 0; i < pixSprites.size(); i++){
   pixSprites.get(i).spriteCycle();
 }
 for(int i = 0; i < ploxSprites.size(); i++){
   ploxSprites.get(i).spriteCycle();
 }
 for(int i = 0; i < omniSprites.size(); i++){
   omniSprites.get(i).spriteCycle();
 }
}

void spawnFood(int x, int y){
  FoodSprite f = new FoodSprite(x, y);
  foodSprites.add(f);
  
}

void makeWall(int wallWidth, int wallHeight, int x, int y){
  
  WallSprite a = new WallSprite(x, y, wallWidth, wallHeight);
  wallSprites.add(a);
    
  
}

void makeBox(int boxWidth, int boxHeight, int wallThickness, int x, int y){
 
 makeWall(boxWidth, wallThickness, x, y);//top
 makeWall(boxWidth + wallThickness, wallThickness, x, y + boxHeight);//bottom
 makeWall(wallThickness, boxHeight, x, y);//left
 makeWall(wallThickness, boxHeight, x + boxWidth, y);//right
 
   
 }


void addNewPix(int life, float sp, float x, float y, double v, float r, ArrayList<FoodSprite> arr){
  
  pixSprites.add(new PixSprite(life, sp, x, y, v, r, arr));
  
}

void addNewPlox(int life, float sp, float x, float y, double v, float r, ArrayList<PixSprite> arr){
  
  ploxSprites.add(new PloxSprite(life, sp, x, y, v, r, arr));
  
}

void addNewOmni(int life, float sp, float x, float y, double v, float r, ArrayList<FoodSprite> arr, ArrayList<PixSprite> arr2){
  
  omniSprites.add(new OmniSprite(life, sp, x, y, v, r, arr, arr2));
  
}

///////// averages ///////////////


////pix
float averagePixSpeed(){ ///////
  float sum = 0;
  for(PixSprite p : pixSprites){
    sum += p.speed;
  }
  if (pixSprites.size() > 0){
    sum /= pixSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}

float averagePixLifetime(){ ////////
  float sum = 0;
  for(PixSprite p : pixSprites){
    sum += p.setLife;
  }
  if (pixSprites.size() > 0){
    sum /= pixSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}


float averagePixVariance(){ ////////
  float sum = 0;
  for(PixSprite p : pixSprites){
    sum += p.variability;
  }
  if (pixSprites.size() > 0){
    sum /= pixSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}

float averagePixRadius(){ //////////
  float sum = 0;
  for(PixSprite p : pixSprites){
    sum += p.radius;
  }
  if (pixSprites.size() > 0){
    sum /= pixSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}

//////////plox

float averagePloxSpeed(){ ///////
  float sum = 0;
  for(PloxSprite p : ploxSprites){
    sum += p.speed;
  }
  if (ploxSprites.size() > 0){
    sum /= ploxSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}

float averagePloxLifetime(){ ////////
  float sum = 0;
  for(PloxSprite p : ploxSprites){
    sum += p.setLife;
  }
  if (ploxSprites.size() > 0){
    sum /= ploxSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}


float averagePloxVariance(){ ////////
  float sum = 0;
  for(PloxSprite p : ploxSprites){
    sum += p.variability;
  }
  if (ploxSprites.size() > 0){
    sum /= ploxSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}

float averagePloxRadius(){ //////////
  float sum = 0;
  for(PloxSprite p : ploxSprites){
    sum += p.radius;
  }
  if (ploxSprites.size() > 0){
    sum /= ploxSprites.size();
  }
  else{
    sum = 0; 
  }

  return sum;
}


////////////////////////////////////maximums///////////////

float maxRadius(){ /////
  float max = 0;
  for(PixSprite p : pixSprites){
    if(p.radius > max){
      max = p.radius;
    }
  }
  
  return max;

}
