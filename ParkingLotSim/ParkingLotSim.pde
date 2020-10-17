class ParkingLotSection { //10 (5x2) Parking Stalls in each Section
  int Stall_num;
  ParkingStall[] Stall_list;
  int x;
  int y;
}

void setup() {

  size(800,400);

}

void draw() {
  ParkingLot p = new ParkingLot();
  p.drawParkingLot();
  
}
