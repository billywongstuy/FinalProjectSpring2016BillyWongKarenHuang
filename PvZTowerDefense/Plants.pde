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
 char letter;
 int x;
 int y;
 double counter;
 
 public Plant(int c, double r, int p, double ra, String n) {
   cost = c;
   rate = r;
   power = p;
   range = ra;
   xsize = 5;
   ysize = 5;
   name = n;
   sRange = range*10;
   counter = rate;
 }
 
  void setX() {
    x = mouseX;  
  }
  
  void setY() {
    y = mouseY;  
  }
  
  void setX(int X) {
    x = X*10+15;  
  }
  
  void setY(int Y) {
    y = Y*10+15;  
  }
 
 
  Zombie findNearestZombie() {
    //find zombies in alive not any zombie
    float distance = Integer.MIN_VALUE;
    Zombie z = null;
    for (int i = 0; i <= range; i++) {
      for (int j = 0; j <= range; j++) {
        int row = (int)((y)/10+range/2-i);
        int col = (int)((x)/10+range/2-j);
         
         //fill(color(255,0,0,100));
         //rect(col*10,row*10,10,10);
               
        if (row >= 0 && row < 68 && col >= 0 && col < 68 && area[row][col] instanceof Road && area[row][col].getZombies().size() > 0 && area[row][col].getZombies().get(0) != null) {
          if (area[row][col].startDistance > distance ) {
            //if (alive.indexOf(area[row][col].getZombies().get(0)) != -1) {
              z = area[row][col].getZombies().get(0);
              distance = area[row][col].startDistance;
            //}
          }
        }        
      }
    }
    return z;
  }
  
  Zombie findNearestZombie(int x, int y) {
    float distance = Integer.MIN_VALUE;
    Zombie z = null;
    for (int i = 0; i <= range/2; i++) {
      for (int j = 0; j <= range/2; j++) {
        int row = (int)(this.y/10+i*y);
        int col = (int)(this.x/10+i*x);
        
        //rect(col*10,row*10,10,10);
              
        
        for (int k = -1; k <= 1; k++) {
          for (int l = -1; l <= 1; l++) {
            //rect((col+l)*10,(row+k)*10,10,10);
            if (row+k >= 0 && row+k < 68 && col+l >= 0 && col+l < 68 && area[row+k][col+l] instanceof Road && area[row+k][col+l].getZombies().size() > 0 && area[row+k][col+l].getZombies().get(0) != null) {
              if (area[row+k][col+l].startDistance > distance ) {
                z = area[row+k][col+l].getZombies().get(0);
                distance = area[row+k][col+l].startDistance;
              }
            }      
          }
        }
      }
    }
    return z;  
  }
 
 
 void attack() {
   if (frameCount % (int)(35*rate) == 0) {
     if (counter > 0) {
        counter -= .5;
        Zombie target = null;
        target = findNearestZombie();
        if (target != null) {
          target.takeDamage(power);  
          //rect(0,0,10,10);
        }
      }
      else {
        counter = rate;  
      }  
   }
 }
 
 
 
 void applyEffects() {};
 
 
}

class Peashooter extends Plant{  
  public Peashooter() {
    super(100,1,1,15,"Peashooter"); 
    letter = 'P';
  } 
  
 // void attack() {
    //if counter > 0
    //set counter - (n)
    
    //closest zombie to end take damage  
    //then set counter to rate
    
    
  //}
  
  void applyEffects() {}
}


class Gloomshroom extends Plant{  
  public Gloomshroom() {
    super(150,1.25,1,13,"Gloom-shroom"); 
    letter = 'G';
  } 
  
  void attack() { //<>//
    if (frameCount % (35*rate) == 0) {
     if (counter > 0) {
        counter -= .5;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            Zombie target = findNearestZombie(i,j);
            if (target != null) {
              target.takeDamage(power);  
            }
          }
        }
      }
      else {
        counter = rate;  
      }  
   }
  }
  
  void applyEffects() {}
}

class Melonpult extends Plant{  
  int blast;
  
  public Melonpult() {
    super(250,2,1,12,"Melon-pult"); 
    letter = 'M';
    blast = 4;
  } 
  
  void attack() {
    if (frameCount % (int)(35*rate) == 0) {
     if (counter > 0) {
        counter -= .5;
        Zombie target = null;
        target = findNearestZombie();
        if (target != null) {
          //target.takeDamage(power);  
          //coords[0] = y component or row
          ArrayList<Zombie>toHit = new ArrayList<Zombie>();
          int x = target.coords[0];
          int y = target.coords[1];
          for (int i = x-blast; i <= x+blast && i >= 0 && i < 68; i++) {
            for (int j = y-blast; j <= y+blast && j >= 0 && j < 68; j++) {
              if (area[i][j] instanceof Road) {
                for (Zombie z: area[i][j].getZombies()) {
                  toHit.add(z);
                }
              }
            }
          }
          for (Zombie z: toHit) {
            z.takeDamage(power);  
          }
        }
      }
      else {
        counter = rate;  
      }  
   }
  }
  
  void applyEffects() {}
}


class Bloomerang extends Plant{  
  Boomerang b;
  int [] target;
  Zombie toHit;
  float bRow;
  float bCol;
  float xDir = 1;
  float yDir = 1;
  float xChange;
  float yChange;
  
  class Boomerang {
    int [] location = new int[2];
    float [] unrounded = new float[2];
    
    public Boomerang() {}
    
    public Boomerang(int row, int col) {
      setLocation(row,col);
    }
    
    void setLocation(int row, int col) {
      location[0] = row;
      location[1] = col;
      unrounded[0] = row;
      unrounded[1] = col;
    }
    
    void incrementLocation(float x, float y) {
      unrounded[0] += y;
      unrounded[1] += x;
      location[0] = (int)(unrounded[0]);
      location[1] = (int)(unrounded[1]);
    }
  }
  
  //
  
  float solveAngle(float x1, float y1, float x2, float y2) {
    return atan(abs(y1-y2)/abs(x1-x2));
  }
  
  public Bloomerang() {
    super(200,1.5,1,13,"Bloomerang");  
    b = new Boomerang();
    letter = 'B';
  } 
  
  void moveBoom() {
    b.incrementLocation(xChange,yChange);
  }
  
  
  void attack() {
    if (toHit == null) {
      toHit = findNearestZombie();  
      if (toHit != null) {
        bRow = y;
        bCol = x;
        System.out.println(toHit.coords[1] + "," + toHit.coords[0]);
        System.out.println((x-15)/10 + "," + (y-15)/10);
        float angle = solveAngle((x-15)/10,(y-15)/10,toHit.coords[1],toHit.coords[0]);
        System.out.println("A: " + angle);
        xChange = 3*cos(angle);
        yChange = 3*sin(angle);
        System.out.println(xChange + " " + yChange);
        if (toHit.coords[0] < (y-15)/10) {
            yChange *= -1;
        }
        if (toHit.coords[1] < (x-15)/10) {
            xChange *= -1;
        }
        b.setLocation((int)(bRow-15)/10,(int)(bCol-15)/10);
      }
    }
    else {
      fill(color(0,255,0));
      rect(b.location[1]*10,b.location[0]*10,10,10);
      if (frameCount % 40 == 0) {
        moveBoom();
        fill(color(255,0,0));
        rect((b.location[1]-1)*10,(b.location[0]-1)*10,30,30);
        for (int i = b.location[0]-1; i <= b.location[0]+1 && i >= 0 && i < 68; i++) {
          //System.out.println("shshshgs");
          for (int j = b.location[1]-1; j <= b.location[1]+1 && j >= 0 && j < 68; j++) {
            //System.out.println("checking");
            if (area[i][j].getZombies() != null) {
              for (Zombie z: area[i][j].getZombies()) {
                z.takeDamage(power);  
              }
            }
          }
        }
      }
    }
  }
  
  void applyEffects() {}
}


class SnowPea extends Plant{  
  public SnowPea() {
    super(125,2,1,14,"Snow_Pea");  
    letter = 'S';
  } 
  
  void attack() {
    if (frameCount % (int)(35*rate) == 0) {
     if (counter > 0) {
        counter -= .5;
        Zombie target = null;
        target = findNearestZombie();
        if (target != null) {
          target.takeDamage(power);  
          target.slow = 0.9;
          target.slowTimer = 300;
          //rect(0,0,10,10);
        }
      }
      else {
        counter = rate;  
      }  
   }    
  }
  
  void applyEffects() {}
}


class Repeater extends Plant{  
  public Repeater() {
    super(400,0.8,2,20,"Repeater");  
    letter = 'R';
  } 
  
  //void attack() {
    
  //}
  
  void applyEffects() {
    //4 shots
  }
}


class Sunflower extends Plant{  
  public Sunflower() {
    super(150,3,0,5,"Sunflower");  
    letter = 'F';
  } 
  
  void attack() {
    if (frameCount % 180 == 0) {
      sun += 25;
    }
  }
  
}


class Spikeweed extends Plant{  
  int stack;
  
  public Spikeweed() {
    super(10,0,1,5,"Spikeweed"); 
    letter = 'W';
    stack = 8;
  } 
  
  void attack() {
    //if zombies here, do damage
    Zombie target = findNearestZombie();
    if (stack <= 0) {
      removePlant(this);
    }
    else if (target != null) {
      target.health -= 1;
      stack -= 1;
    }
  }
  
}