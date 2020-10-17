class ScreenSelector {

  int screen, foodPerHundred, whatGraph;


  int  pixRadius = 20, pixLife = 250;
  float pixSpeed = 4, pixVariability = 1;

  int  ploxRadius = 30, ploxLife = 250;
  float ploxSpeed = 4.5, ploxVariability = 1;

  ScreenSelector(int sc) {

    screen = sc;
    whatGraph = 0;
  }

  void drawCurrentScreen() {
    if (screen == 0) {
      screenZero();
    } else if (screen == 1) {
      screenOne();
    } else if (screen == 2) {
      screenTwo();
    } else if (screen == 3) {
      screenThree();
    } else if (screen == 4) {
      screenFour();
    } else if (screen == 5) {
      screenFive();
    }
  }

  IncrementButton pixCount = new IncrementButton("-", "+", 350, 400, 20, 30, 16, 100);
  IncrementButton ploxCount = new IncrementButton("-", "+", 350, 450, 20, 30, 16, 100);
  IncrementButton foodCount = new IncrementButton("-", "+", 350, 500, 20, 30, 16, 100);

  Button incrByOne = new Button(" +1 ", 800 - 90, 10, 20, 10, 12);
  Button incrByFive = new Button(" +5 ", 800 - 60, 10, 20, 10, 12);
  Button incrByTen = new Button(" +10 ", 800 - 30, 10, 20, 10, 12);

  Button changePixStats = new Button("Change Pix Stats", 250, 300, 100, 40, 10);
  Button changePloxStats = new Button("Change Plox Stats", 400, 300, 100, 40, 10);


  int numberOfFood = 100, numberOfPix = 15, numberOfPlox = 10;
  int clickCounter = 30, counterStart = 20;
  int increment = 1;

  void screenZero() { ////////////////////   ZERO   ////////////////////////


    background(0, 204, 0);
    textSize(45);
    fill(0);
    text("StartScreen", 300, 100);


    Button start = new Button("start", 350, 700, 100, 50, 40); //start Button//
    start.drawButton();
    if (start.isPressed()) {
      screen = 1;

      clearArrays();
      onStart(numberOfFood, numberOfPix, numberOfPlox);
      setup();
    }

    Button edit = new Button("Map Editor", 350, 600, 100, 50, 20);
    textSize(19);
    edit.drawButton();
    if (edit.isPressed()) {
      screen = 5;
    }

    textSize(10);    

    incrByOne.drawButton();
    incrByFive.drawButton();
    incrByTen.drawButton();

    if (incrByOne.isPressed() || key == '1') {
      increment = 1;
    } else if (incrByFive.isPressed() || key == '2') {
      increment = 5;
    } else if (incrByTen.isPressed() || key == '3') {
      increment = 10;
    }

    changePixStats.drawButton();
    changePloxStats.drawButton();

    if (changePixStats.isPressed()) {
      screen = 3;
    } else if (changePloxStats.isPressed()) {
      screen = 4;
    }

    textSize(16); 


    pixCount.drawButton(); // pix count button //
    text(numberOfPix, (pixCount.x + pixCount.buttonWidth) + pixCount.spacing/2-pixCount.textSize, pixCount.y + 2.5*pixCount.textSize);
    text("number of pix ", pixCount.x - 140, pixCount.y + 2.5*pixCount.textSize);
    if (pixCount.isPressedLeft()  && clickCounter <= 0) {
      numberOfPix -= increment;
      clickCounter = counterStart;
    } else if (pixCount.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      numberOfPix += increment;
    }


    ploxCount.drawButton(); // plox count button // 
    text(numberOfPlox, (ploxCount.x + ploxCount.buttonWidth) + ploxCount.spacing/2-ploxCount.textSize, ploxCount.y + 2.5*ploxCount.textSize); 
    text("number of plox ", ploxCount.x - 140, ploxCount.y + 2.5*ploxCount.textSize);
    if (ploxCount.isPressedLeft()  && clickCounter <= 0) {
      numberOfPlox -= increment;
      clickCounter = counterStart;
    } else if (ploxCount.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      numberOfPlox += increment;
    } 

    foodCount.drawButton(); // food count button //
    text(numberOfFood, (foodCount.x + foodCount.buttonWidth) + foodCount.spacing/2-foodCount.textSize, foodCount.y + 2.5*foodCount.textSize);
    text("number of Food ", foodCount.x - 140, foodCount.y + 2.5*foodCount.textSize);
    if (foodCount.isPressedLeft()  && clickCounter <= 0) {
      numberOfFood -= increment;
      clickCounter = counterStart;
    } else if (foodCount.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      numberOfFood += increment;
    }

    if (counter > 0) {
      clickCounter--;
    }
  }

  void screenOne() { ////////////////////   ONE   ////////////////////////
    textSize(12);
    background(0, 204, 0);

    buildWorld();
    if (counter > 0) {
      counter--;
    } else {
      for (int i = 0; i < foods/10; i++) {
        spawnFood((int)random(10, width-10), (int)random(10, height-10));
      }
      counter = 100;
      TableRow newRow = table.addRow();
      newRow.setInt("PixPopulation", pixSprites.size());   
      newRow.setDouble("PixSpeed", averagePixSpeed());
      newRow.setDouble("PixLife", averagePixLifetime());
      newRow.setDouble("PixVariance", averagePixVariance());
      newRow.setDouble("PixRadius", averagePixRadius());

      newRow.setInt("PloxPopulation", ploxSprites.size());
      newRow.setDouble("PloxSpeed", averagePloxSpeed());
      newRow.setDouble("PloxLife", averagePloxLifetime());
      newRow.setDouble("PloxVariance", averagePloxVariance());
      newRow.setDouble("PloxRadius", averagePloxRadius());
      saveTable(table, "Evo2/save.csv");
    }


    fill(0);


    text(foodSprites.size(), width - 60, 140);

    text(pixSprites.size(), 20, 20);
    text(averagePixSpeed(), 20, 40);
    text(averagePixLifetime(), 20, 60);
    text(averagePixVariance(), 20, 80);
    text(averagePixRadius(), 20, 100);

    text(ploxSprites.size(), width - 60, 20);    
    text(ploxSprites.size(), width - 60, 20);
    text(averagePloxSpeed(), width - 60, 40);
    text(averagePloxLifetime(), width - 60, 60);
    text(averagePloxVariance(), width - 60, 80);
    text(averagePloxRadius(), width - 60, 100);

    text(maxRadius(), 80, 20);
  }

  void screenTwo() { ////////////////////   TWO   ////////////////////////
    background(0, 204, 0);


    drawGraph();

    int buttonX = 600;
    int buttonY = 160;


    Button speed = new Button("speed", buttonX, buttonY, 60, 20, 12);
    speed.drawButton();
    Button radius = new Button("radius", buttonX, buttonY + 40, 60, 20, 12);
    radius.drawButton();
    Button variance = new Button("variance", buttonX, buttonY + 80, 60, 20, 12);
    variance.drawButton();
    Button life = new Button("life", buttonX, buttonY + 120, 60, 20, 12);
    life.drawButton();


    Button restart = new Button("restart", width - 40, height - 40, 40, 40, 11);
    restart.drawButton();

    if (speed.isPressed()) {  ////////////buttton presses////
      whatGraph = 0;
    } else if (radius.isPressed()) {
      whatGraph = 1;
    } else if (variance.isPressed()) {
      whatGraph = 2;
    } else if (life.isPressed()) {
      whatGraph = 3;
    } else if (restart.isPressed()) {
      screen = 0;
    }

    int graphX = 150, graphX2 = 150; ///////////////drawing Graphs
    int graphY = 290, graphY2 = 550;


    if (whatGraph == 0) {
      drawCustomGraph("PixSpeed", graphX, graphY, 10); 
      drawCustomGraph("PloxSpeed", graphX2, graphY2, 10);
    } else if (whatGraph == 1) {
      drawCustomGraph("PixRadius", graphX, graphY, 4); 
      drawCustomGraph("PloxRadius", graphX2, graphY2, 4);
    } else if (whatGraph == 2) {
      drawCustomGraph("PixVariance", graphX, graphY, 40);  
      drawCustomGraph("PloxVariance", graphX2, graphY2, 40);
    } else {
      drawCustomGraph("PixLife", graphX, graphY, 0.20); 
      drawCustomGraph("PloxLife", graphX2, graphY2, 0.20);
    }



    fill(0);


    text(foodSprites.size(), width - 60, 200);


    int pixX = 20;
    int pixY = 110;

    fill(255);
    rect(pixX - 10, pixY - 20, 50, 110);

    fill(0);

    text(pixSprites.size(), pixX, pixY);
    text(averagePixSpeed(), pixX, pixY + 20);
    text(averagePixLifetime(), pixX, pixY + 40);
    text(averagePixVariance(), pixX, pixY + 60);
    text(averagePixRadius(), pixX, pixY + 80);

    int ploxX = 20;
    int ploxY = 370;

    fill(255);
    rect(ploxX - 10, ploxY - 20, 50, 110);

    fill(0);

    text(ploxSprites.size(), ploxX, ploxY);
    text(averagePloxSpeed(), ploxX, ploxY + 20);
    text(averagePloxLifetime(), ploxX, ploxY + 40);
    text(averagePloxVariance(), ploxX, ploxY + 60);
    text(averagePloxRadius(), ploxX, ploxY + 80);

    text(maxRadius(), 80, 20);
  }


  IncrementButton setSpeed = new IncrementButton("-", "+", 350, 400, 20, 30, 16, 100);
  IncrementButton setRadius = new IncrementButton("-", "+", 350, 450, 20, 30, 16, 100);
  IncrementButton setLife = new IncrementButton("-", "+", 350, 500, 20, 30, 16, 100);
  IncrementButton setVariability = new IncrementButton("-", "+", 350, 550, 20, 30, 16, 100);


  Button back = new Button("Back", 0, 0, 100, 60, 16); //start Button//
  void screenThree() { ///////////////////////// THREE //////////////// PIX STAT CHANGE SCREEN //////////////

    background(100);

    textSize(10);

    incrByOne.drawButton();
    incrByFive.drawButton();
    incrByTen.drawButton();

    if (incrByOne.isPressed() || key == '1') {
      increment = 1;
    } else if (incrByFive.isPressed() || key == '2') {
      increment = 5;
    } else if (incrByTen.isPressed() || key == '3') {
      increment = 10;
    }

    textSize(16);  

    back.drawButton();

    setSpeed.drawButton(); // Speed count button //
    text(pixSpeed, (setSpeed.x + setSpeed.buttonWidth) + setSpeed.spacing/3 - setSpeed.textSize, setSpeed.y + 2.5*setSpeed.textSize);
    text("Speed ", setSpeed.x - 100, setSpeed.y + 2.5*setSpeed.textSize);
    if (setSpeed.isPressedLeft()  && clickCounter <= 0) {
      pixSpeed -= increment * 0.1;
      clickCounter = counterStart;
    } else if (setSpeed.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      pixSpeed += increment * 0.1;
    }

    setRadius.drawButton(); // Radius count button //
    text(pixRadius, (setRadius.x + setRadius.buttonWidth) + setRadius.spacing/2 - setRadius.textSize, setRadius.y + 2.5*setRadius.textSize);
    text("Radius ", setRadius.x - 100, setRadius.y + 2.5*setRadius.textSize);
    if (setRadius.isPressedLeft()  && clickCounter <= 0) {
      pixRadius -= increment;
      clickCounter = counterStart;
    } else if (setRadius.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      pixRadius += increment;
    }

    setLife.drawButton(); // Life count button //
    text(pixLife, (setLife.x + setLife.buttonWidth) + setLife.spacing/2 - setLife.textSize, setLife.y + 2.5*setLife.textSize);
    text("Life ", setLife.x - 100, setLife.y + 2.5*setLife.textSize);
    if (setLife.isPressedLeft()  && clickCounter <= 0) {
      pixLife -= increment;
      clickCounter = counterStart;
    } else if (setLife.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      pixLife += increment;
    }

    setVariability.drawButton(); // Variability count button //
    text(pixVariability, (setVariability.x + setVariability.buttonWidth) + setVariability.spacing/3-setVariability.textSize, setVariability.y + 2.5*setVariability.textSize);
    text("Variability ", setVariability.x - 100, setVariability.y + 2.5*setVariability.textSize);
    if (setVariability.isPressedLeft()  && clickCounter <= 0) {
      pixVariability -= increment * 0.1;
      clickCounter = counterStart;
    } else if (setVariability.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      pixVariability += increment * 0.1;
    }


    if (back.isPressed()) {  
      screen = 0;
    }


    if (counter > 0) {
      clickCounter--;
    }
  }

  void screenFour() { ///////////////////////////FOUR ////////////////////////////////
    background(100);

    textSize(10);

    incrByOne.drawButton();
    incrByFive.drawButton();
    incrByTen.drawButton();

    if (incrByOne.isPressed() || key == '1') {
      increment = 1;
    } else if (incrByFive.isPressed() || key == '2') {
      increment = 5;
    } else if (incrByTen.isPressed() || key == '3') {
      increment = 10;
    }

    textSize(16);  

    back.drawButton();

    setSpeed.drawButton(); // Speed count button //
    text(ploxSpeed, (setSpeed.x + setSpeed.buttonWidth) + setSpeed.spacing/3 - setSpeed.textSize, setSpeed.y + 2.5*setSpeed.textSize);
    text("Speed ", setSpeed.x - 100, setSpeed.y + 2.5*setSpeed.textSize);
    if (setSpeed.isPressedLeft()  && clickCounter <= 0) {
      ploxSpeed -= increment * 0.1;
      clickCounter = counterStart;
    } else if (setSpeed.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      ploxSpeed += increment * 0.1;
    }

    setRadius.drawButton(); // Radius count button //
    text(ploxRadius, (setRadius.x + setRadius.buttonWidth) + setRadius.spacing/2 - setRadius.textSize, setRadius.y + 2.5*setRadius.textSize);
    text("Radius ", setRadius.x - 100, setRadius.y + 2.5*setRadius.textSize);
    if (setRadius.isPressedLeft()  && clickCounter <= 0) {
      ploxRadius -= increment;
      clickCounter = counterStart;
    } else if (setRadius.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      ploxRadius += increment;
    }

    setLife.drawButton(); // Life count button //
    text(ploxLife, (setLife.x + setLife.buttonWidth) + setLife.spacing/2 - setLife.textSize, setLife.y + 2.5*setLife.textSize);
    text("Life ", setLife.x - 100, setLife.y + 2.5*setLife.textSize);
    if (setLife.isPressedLeft()  && clickCounter <= 0) {
      ploxLife -= increment;
      clickCounter = counterStart;
    } else if (setLife.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      ploxLife += increment;
    }

    setVariability.drawButton(); // Variability count button //
    text(ploxVariability, (setVariability.x + setVariability.buttonWidth) + setVariability.spacing/3-setVariability.textSize, setVariability.y + 2.5*setVariability.textSize);
    text("Variability ", setVariability.x - 100, setVariability.y + 2.5*setVariability.textSize);
    if (setVariability.isPressedLeft()  && clickCounter <= 0) {
      ploxVariability -= increment * 0.1;
      clickCounter = counterStart;
    } else if (setVariability.isPressedRight() && clickCounter <= 0) {
      clickCounter = counterStart;
      ploxVariability += increment * 0.1;
    }


    if (back.isPressed()) {  
      screen = 0;
    }


    if (counter > 0) {
      clickCounter--;
    }
  }

  void screenFive() { ///////////////////////////////////////////////////////////////////////////Five//////////////////////////////////////////


    textSize(12);
    background(0, 204, 0);
    buildWorld();
    clearArrays();
    if (counter > 0) {
      counter--;
    } else {

      counter = 2;
    }

    if (mouseButton == LEFT && counter <= 0) {
      wallSprites.add(new WallSprite(mouseX, mouseY, 5, 5));
    }
    if (mouseButton == RIGHT) {
      screen = 0;
    }
  }

  void drawGraph() {

    table = loadTable("Evo2/save.csv", "header");

    int pixPopulation, ploxPopulation, lastPix = table.getRow(0).getInt("PixPopulation")/2, lastPlox = table.getRow(0).getInt("PloxPopulation")/2;
    float x = 150, y = 780;

    line(x, y, x, y-200);
    line(x, y, x+400, y);
    fill(255);
    rect(x, y, 400, -200);

    fill(0);
    for (int i = 0; i < 10; i++) {
      text(i * 40, x-24, y - i * 20 + 6);
      stroke(0, 30);
      line(x, y - i * 20, x + 400, y - i * 20);
    }

    for (TableRow row : table.rows()) {
      pixPopulation = row.getInt("PixPopulation");
      ploxPopulation = row.getInt("PloxPopulation");
      stroke(0, 0, 255);
      line(x - 1, y - lastPix, x, y - pixPopulation/2);
      stroke(255, 0, 0);
      line(x-1, y - lastPlox, x++, y - ploxPopulation/2);

      lastPix = pixPopulation/2;
      lastPlox = ploxPopulation/2;
    }
  }

  void drawCustomGraph(String header, int x, int y, float multi) {
    table = loadTable("Evo2/save.csv", "header");

    float headerValue, lastValue = table.getRow(0).getFloat(header)*multi;

    line(x, y, x, y-200);
    line(x, y, x+400, y);

    fill(0);
    text(header, x + 190, y - 212);

    fill(255);
    rect(x, y, 400, -200);

    fill(0);
    for (int i = 0; i < 10; i++) {
      text(i * (20*(1/multi)), x-48, y - i * 20 + 6);
      stroke(0, 30);
      line(x, y - i * 20, x + 400, y - i * 20);
    }

    for (TableRow row : table.rows()) {
      headerValue = row.getFloat(header);
      stroke(0);
      line(x - 1, y - lastValue, x++, y - headerValue*multi);


      lastValue = headerValue*multi;
    }
  }


  void drawCustomGraph(String headerOne, String headerTwo, int x, int y) { ////////////needs to be fixed /////////////

    table = loadTable("Evo2/save.csv", "header");

    float headerOneValue, headerTwoValue, lastValueOne = 0, lastValueTwo = 0;

    for (TableRow row : table.rows()) {
      headerOneValue = row.getFloat(headerOne);
      headerTwoValue = row.getFloat(headerTwo);
      stroke(0, 0, 255);
      line(x - 1, y - lastValueOne, x, y - headerOneValue/2);
      stroke(255, 0, 0);
      line(x-1, y - lastValueTwo, x++, y - headerTwoValue/2);

      lastValueOne = headerOneValue/2;
      lastValueTwo = headerTwoValue/2;
    }
  }

  void onStart(int nFood, int nPix, int nPlox) {
    foods = (nFood);

    for (int i = 0; i < foods; i++) {
      spawnFood((int)random(10, width-10), (int)random(10, height-10));
    }
    for (int i = 0; i < nPix; i++) {
      addNewPix(pixLife, pixSpeed, random(width-10), random(height - 10), pixVariability, pixRadius, foodSprites);
    }

    for (int i = 0; i < nPlox; i++) {
      addNewPlox(ploxLife, ploxSpeed, random(width-10), random(height - 10), ploxVariability, ploxRadius, pixSprites);
    }
  }


  void clearArrays() {
    //wallSprites = new ArrayList<WallSprite>(0);
    foodSprites = new ArrayList<FoodSprite>(0);
    pixSprites = new ArrayList<PixSprite>(0);
    ploxSprites = new ArrayList<PloxSprite>(0);
  }
}
