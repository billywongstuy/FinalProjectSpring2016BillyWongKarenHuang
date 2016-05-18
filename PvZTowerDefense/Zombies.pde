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
  
  int[] nextSpace(){
    if(56 <= coords[0] && coords[0] <= 62 && 0 <= coords[1] && coords[1] <= 19){
      return new int[]{coords[0],coords[1] + 1};
    }
    else if(49 <= coords[0] && coords[0] <= 62 && 16 <= coords[1] && coords[1] <= 22){
      return new int[]{coords[0] - 1,coords[1]};
    }
    else if(46 <= coords[0] && coords[0] <= 52 && 10 <= coords[1] && coords[1] <= 22){
      return new int[]{coords[0],coords[1] - 1};
    }
    else if(9 <= coords[0] && coords[0] <= 52 && 7 <= coords[1] && coords[1] <= 13){
      return new int[]{coords[0] - 1,coords[1]};
    }
    else if(6 <= coords[0] && coords[0] <= 12 && 7 <= coords[1] && coords[1] <= 34){
      return new int[]{coords[0],coords[1] + 1};
    }
    else if(6 <= coords[0] && coords[0] <= 21 && 31 <= coords[1] && coords[1] <= 37){
      return new int[]{coords[0] + 1,coords[1]};
    }
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