//void showUpgrades() {
  //
 // switch(){
  //    
 // }
//}

class Upgrade {
  String stat;
  float amount;
  float cost;
  
  public Upgrade(String effect, float amt, float c) {
    stat = effect;
    amount = amt;
    cost = c;
  }
  
  boolean applyUpgrade(Plant p) {
   if (sun >= cost) {
     if (stat.equals("range")) {
       p.range += amount;  
     }
     else if (stat.equals("pierce")) {
       p.pierce += amount;
     }
     else if (stat.equals("winter")) {
       p.setSpecial(true);
     }
     else if (stat.equals("rate")) {
       p.rate -= amount;
     }
     else if (stat.equals("slower")) {
       p.setSpecial(amount);
     }
     else if (stat.equals("blast")) {
       p.setSpecial(amount);
     }
     else if (stat.equals("spread")) {
      p.setSpecial(true); 
     }
     else if (stat.equals("yield")) {
       p.setSpecial(amount);
     }
     else if (stat.equals("damage")) {
       p.power += amount;  
     }
     return true;  
   }
    return false;
  }
  
}

class UpgradeChain {
  Upgrade[] chain = new Upgrade[2];
  
  public UpgradeChain(String e1, float a1, float c1, String e2, float a2, float c2) {
    fill(e1, a1, c1, e2, a2, c2);  
  }
  
  void fill(String e1, float a1, float c1, String e2, float a2, float c2) {
    chain[0] = new Upgrade(e1,a1,c1);
    chain[1] = new Upgrade(e2,a2,c2);
  }
}