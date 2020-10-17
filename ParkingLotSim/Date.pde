public class Date{
  private int hourIn;
  private int minuteIn;
  private int hourOut;
  private int minuteOut;
  private int hours;
  private int minutes;
  public Date(int hour, int minute){
    hourIn=hour;
    minuteIn=minute;
  }
  
  public int hours(){
    return hourOut-hourIn;
  }
  
  public int minutes(){
    return minuteOut-minuteIn;
  }
  
  
  public void setHourOut(int hour ){
    hourOut = hour;
  }
  
  public void setMinuteOut(int minute ){
    minuteOut = minute;
  }
  
  
}
