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
  public void drawStall(int posx, int posy){
    fill(0);
    rect(posx-5,posy-5, 45,25);
    fill(100);
    rect(posx,posy, 40,20);
  }
  
}
