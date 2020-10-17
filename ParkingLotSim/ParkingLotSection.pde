class ParkingLotSection { //10 (5x2) Parking Stalls in each Section
  ParkingStall[] stall_list;
  int x;
  int y;
  int section_width;
  int section_height;
  
  ParkingLotSection(int tx, int ty, int w, int h){
    stall_list = new ParkingStall[10];
    x=tx;
    y=ty;
    section_width = w;
    section_height = h;
  }
  
  void draw_section(){
    
    for(int i = 0; i < 10; i++){
      stall_list[i] = new ParkingStall(false);      
    }
    
    for(int i = 0; i < 2; i++){
      stall_list[i].drawStall(i*20, 0);
      for(int j = 0; j < 5; j++){
        stall_list[i+j].drawStall((i+j)*20, section_width/2);
      }
      i=0;
    }
  }
}
