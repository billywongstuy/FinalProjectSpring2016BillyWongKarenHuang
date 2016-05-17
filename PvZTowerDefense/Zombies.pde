abstract class Zombie {
  int speed;
  int health;
  String type;
  String[]special;
  int gain; //sun yield
  int[] coords = new int[2];
  
  public Zombie(int s, int h, String t, String[] sp, int g){
    speed = s;
    health = h;
    type = t;
    special = sp;
    gain = g;
    coords[0] = (int)(Math.random()*6) + 56;
    coords[1] = 0;
  }
  
  void takeDamage(int h) {
    health -= h;  
  }
  
  String getType(){
    return type;
  }
  
  int[] getCoords(){
    return coords;
  }
  
  void move(){};
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