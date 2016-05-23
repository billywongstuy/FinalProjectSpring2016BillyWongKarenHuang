class Level{
  
 public Level(int y) {
   yield = y;
 }
  
 List<Zombie>zombies= new LinkedList<Zombie>(); 
 int yield = 0;
 
 void spawn(){
   //for(int i = 0;i < zombies.size();i++){
     //area[0][58].setZombies(zombies.remove(i));
     //area[zombies.get(i).getCoords()[0]][zombies.get(i).getCoords()[1]].setZombies(zombies.get(i));
   //}
   if (zombies.size() > 0) {
     Zombie z = zombies.remove(0);
     area[0][58].setZombies(z);
     alive.add(z);
   }
 }
 
 void addZombie(int n, Zombie z){
   for(int i = 0;i < n;i++){
     if (z instanceof Normal) {
       zombies.add(new Normal());  
     }
     else if (z instanceof Cone) {
       zombies.add(new Cone());  
     }
     else if (z instanceof Bucket) {
       zombies.add(new Bucket());  
     }
     else if (z instanceof Football) {
       zombies.add(new Football());  
     }
     else if (z instanceof Gargantuar) {
       zombies.add(new Gargantuar());  
     }
   }
  }
}
void setupLevels(){
  l1 = new Level(100);
  l1.addZombie(20, new Normal());
  l2 = new Level(150);
  l2.addZombie(30, new Normal());
  l3 = new Level(200);
  l3.addZombie(20, new Normal());
  l3.addZombie(5, new Cone());
  ltest = new Level(100);
  ltest.addZombie(1,new Normal());
}