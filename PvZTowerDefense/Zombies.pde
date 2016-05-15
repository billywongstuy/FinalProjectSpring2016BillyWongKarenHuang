abstract class Zombie {
  int speed;
  int health;
  String[]special;
  int gain; //sun yield
  
  public Zombie(int s, int h, String[] sp, int g){
    speed = s;
    health = h;
    special = sp;
    gain = g;
  }
  
  void takeDamage(int h) {
    health -= h;  
  }
  
  void move(){};
}

class Normal extends Zombie{
  public Normal(){
    super(3,2,new String[1],5);
  }
}

class Cone extends Zombie{
  public Cone(){
    super(3,4,new String[1],10);
  }
}

class Bucket extends Zombie{
  public Bucket(){
    super(3,6,new String[1],15);
  }
}

class Football extends Zombie{
  public Football(){
    super(6,10,new String[1],25);
  }
}

class Gargantuar extends Zombie{
  public Gargantuar(){
    super(2,20,new String[1],40);
  }
}