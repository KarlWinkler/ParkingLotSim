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
