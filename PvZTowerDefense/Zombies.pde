abstract class Zombie {
  int speed;
  int health;
  String[]special;
  int gain; //sun yield
  
  void takeDamage(int h) {
    health -= h;  
  }
  
  void move(){};
}