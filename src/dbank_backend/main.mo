import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor Dbank
{
  var initial = 100;
  public func addBal(amt:Nat){
    initial+=amt;
    Debug.print(debug_show (initial));
  };
   public func withDraw(amt:Nat){
    initial-=amt;
    Debug.print(debug_show (initial));
  };
  public query func checkBal():async Nat{
   return initial;
  };
}
