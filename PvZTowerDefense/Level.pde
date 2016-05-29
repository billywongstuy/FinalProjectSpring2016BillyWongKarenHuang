class Level{
  
 public Level() {
   
 }
  
 List<Zombie>zombies= new LinkedList<Zombie>(); 
 
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
  l1 = new Level();
  l1.addZombie(20, new Normal());
  l2 = new Level();
  l2.addZombie(30, new Normal());
  l3 = new Level();
  l3.addZombie(20, new Normal());
  l3.addZombie(5, new Cone());
  ltest = new Level();
  ltest.addZombie(20,new Bucket());
}