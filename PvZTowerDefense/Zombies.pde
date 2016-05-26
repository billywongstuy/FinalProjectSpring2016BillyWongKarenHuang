abstract class Zombie {
  int speed;
  int health;  
  String type;
  String[]special;
  int gain; //sun yield
  int[] coords = new int[2];
  float slow = 1;
  int slowTimer = 0;
  
  public Zombie(int s, int h, String t, String[] sp, int g){
    speed = s;
    health = h;
    type = t;
    special = sp;
    gain = g;
    coords[0] = 0;
    coords[1] = 58;
  }
  void takeDamage(int h) {
  //System.out.println("ow " + h + " damage now " + health + " hp");
    health -= h;  
  }
  
  String getType(){
    return type;
  }
  
  int[] getCoords(){
    return coords;
  }
  
  boolean move(){
    if (area[coords[0]][coords[1]].startDistance < path.size()) {
      int [] temp = area[coords[0]][coords[1]].next().getCoords();
      area[coords[0]][coords[1]].removeZombie(this);
      coords = temp;
      area[temp[0]][temp[1]].setZombies(this);
      return true;
    }
    return false;
  }
  
  void die() {
    area[coords[0]][coords[1]].removeZombie(this);
    alive.remove(alive.indexOf(this));
    sun += gain;
  }
  
}

class Normal extends Zombie{
  public Normal(){
    super(3,2,"Normal",new String[1],5);
  }
}

class Cone extends Zombie{
  public Cone(){
    super(3,4,"Cone",new String[1],10);
  }
}

class Bucket extends Zombie{
  public Bucket(){
    super(3,6,"Bucket",new String[1],15);
  }
}

class Football extends Zombie{
  public Football(){
    super(6,10,"Football",new String[1],25);
  }
}

class Gargantuar extends Zombie{
  public Gargantuar(){
    super(2,20,"Gargantuar",new String[1],40);
  }
}