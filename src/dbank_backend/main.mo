import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Dbank
{
  stable var initial:Float = 100;
  // initial:=100;
  stable var startTime = Time.now();
  // startTime := Time.now();
  public func addBal(amt:Float){
    initial+=amt;
    Debug.print(debug_show (initial));
  };
   public func withDraw(amt:Float){
    initial-=amt;
    Debug.print(debug_show (initial));
  };
  public query func checkBal():async Float{
   return initial;
  };
public  func compound(){
   let currentTime=Time.now();
   let timeElapsed=(currentTime-startTime)/1000000000;
   initial:=initial*(1.01**Float.fromInt(timeElapsed));
   startTime:=currentTime;
  };
}
