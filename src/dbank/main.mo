import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank {
  var currentvalue: Float = 500;
  currentvalue:= 0;
  var startTime=Time.now();
  startTime:=Time.now();
  Debug.print(debug_show (startTime));

public func topup(amount: Float){
  currentvalue+=amount;
  Debug.print(debug_show (currentvalue));

};

public func withdraw(amount: Float){
  let tempvalue: Float=currentvalue-amount;
  if(tempvalue >= 0){
  currentvalue-=amount;
  Debug.print(debug_show (currentvalue));
  }
  else {
    Debug.print("Amount is too large");
  }

};
public query func checkBalance():async Float {
  return currentvalue;
};
public func compound(){
  let currenttime = Time.now();
  let timeelapsedNS = currenttime - startTime;
  let timeelapsedS = timeelapsedNS / 3600000000000;
  let timeelapsedMinutes = timeelapsedNS / (60 * 1000000000);
  currentvalue := currentvalue*(1.01**Float.fromInt(timeelapsedMinutes));
  startTime:= currenttime;
};
}