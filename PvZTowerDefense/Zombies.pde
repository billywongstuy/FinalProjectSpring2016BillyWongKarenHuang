abstract class Zombie {
  int speed;
  int health;
  String[]special;
  
  void takeDamage(int h) {
    health -= h;  
  }
}