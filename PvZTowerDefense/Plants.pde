abstract class Plant {
 int [] upgrade = new int[2];
 int cost;
 double rate; //1 per how many seconds
 int power;
 double range;//radius of range
 double sRange;
 int xsize;
 int ysize;
 String name;
 

 void attack() {};
 void applyEffects() {};
 
 public Plant(int c, double r, int p, double ra, String n) {
   cost = c;
   rate = r;
   power = p;
   range = ra;
   xsize = 5;
   ysize = 5;
   name = n;
   sRange = range*10;
 }
 
}

class Peashooter extends Plant{  
  public Peashooter() {
    super(100,1,1,15,"Peashooter");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {}
}


class Gloomshroom extends Plant{  
  public Gloomshroom() {
    super(150,1.25,1,12,"Gloom-shroom");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {}
}

class Melonpult extends Plant{  
  public Melonpult() {
    super(250,2,2,10,"Melon-pult");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {}
}


class Bloomerang extends Plant{  
  public Bloomerang() {
    super(200,1.5,1,12,"Bloomerang");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {}
}


class SnowPea extends Plant{  
  public SnowPea() {
    super(125,2,1,12,"Snow_Pea");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {}
}


class Repeater extends Plant{  
  public Repeater() {
    super(400,1,1,20,"Repeater");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {
    //4 shots
  }
}


class Sunflower extends Plant{  
  public Sunflower() {
    super(150,3,0,5,"Sunflower");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {
    //make sun
  }
}


class Spikeweed extends Plant{  
  public Spikeweed() {
    super(150,0,1,5,"Spikeweed");     
  } 
  
  void attack() {
    
  }
  
  void applyEffects() {
    //on road
  }
}