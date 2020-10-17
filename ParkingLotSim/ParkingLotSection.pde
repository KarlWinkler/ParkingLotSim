class ParkingLotSection { //10 (5x2) Parking Stalls in each Section
  ParkingStall[] Stall_list;
  int x;
  int y;
  int section_width;
  int section_height;
  
  ParkingLotSection(int tx, int ty, int w, int h){
    x=tx;
    y=ty;
    section_width = w;
    section_height = h;
  }
  
  void draw_section(){
    fill(144,238,144);
    rect(x, y, section_width, section_height);
    noFill();
    stroke(255, 255, 255);
    for (int i = 0; i <= 5; i++) {
      for (int j = 0; j <= 2; j++) {
        rect(i * section_width, j * section_height, section_width/5, section_height/2);
      }
    }
  }
}
