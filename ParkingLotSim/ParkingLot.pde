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
    
    
}
  
  void drawParkingSections(){
   
    for(int i = 0; i < 6; i++){
      sections.add(new ParkingLotSection());
    }
    
  }
  
}


public class ParkingStall{
  private boolean occupied;
  public ParkingStall(boolean isOccupied){
    occupied = isOccupied;
  }
  
  public boolean getOccupied(){
    return occupied;
  }
  public void setOccpied(boolean newStatus){
    occupied = newStatus;
  }
  
}
