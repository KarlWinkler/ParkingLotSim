class MapEditor {

  MapEditor() {
  }

  void buildScreen() { 
    textSize(12);
    background(0, 204, 0);

    buildWorld();
    if (counter > 0) {
      counter--;
    }
  }

  void update() {

    if (mousePressed) {
      placeWall();
    }
  }

  void placeWall() {

    wallSprites.add(new WallSprite(mouseX, mouseY, 5, 5));
  }
}
