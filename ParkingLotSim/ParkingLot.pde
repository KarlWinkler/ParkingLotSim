public class ParkingLot{
  
  ArrayList<ParkingLotSection> sections;
  
  ParkingLot(){
    sections = new ArrayList<ParkingLotSection>();
    
  }
  
  void drawParkingLot(){
    fill(0,155,0);
    rect(-1, -1, width+1, height+1);
    fill(255);
    rect(30, 15, 740, 370);
    fill(125);
    rect(35, 20, 730, 360);
    drawParkingSections();
    
}
  
  void drawParkingSections(){
   
    for(int i = 0; i < 2; i++){
      sections.add(new ParkingLotSection(i*100 + 100, 50, 20*5, 20*2));
      for(int j = 0; j < 3; j++){
        sections.add(new ParkingLotSection((i+j)*100 + 100, (i+j)*20+10, 20*5, 20*2));
      }
    }
    for(int i = 0; i < 3; i++){
      sections.get(i).draw_section();
      for(int j = 0; j < 3; j++){
        sections.get(i+j).draw_section();
      }
    }
  }
  
}
