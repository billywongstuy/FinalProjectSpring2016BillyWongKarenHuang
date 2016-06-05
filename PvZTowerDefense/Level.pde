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
  levels[0] = new Level(100);
  levels[0].addZombie(20, new Normal());
  
  levels[1] = new Level(125);
  levels[1].addZombie(30, new Normal());
  
  levels[2] = new Level(150);
  levels[2].addZombie(20, new Normal());
  levels[2].addZombie(5, new Cone());
  //ltest = new Level(100);
  //ltest.addZombie(1,new Normal());
  
  levels[3] = new Level(175);
  levels[3].addZombie(30, new Normal());
  levels[3].addZombie(10, new Cone());
  
  levels[4] = new Level(200);
  levels[4].addZombie(20, new Cone());
  levels[4].addZombie(20, new Normal());
  levels[4].addZombie(10, new Cone());
  levels[4].addZombie(10, new Normal());
 
  levels[5] = new Level(225);
  levels[5].addZombie(20, new Normal());
  levels[5].addZombie(20, new Cone());
  levels[5].addZombie(5, new Bucket());
  
  levels[6] = new Level(250);
  levels[6].addZombie(10, new Bucket());
  levels[6].addZombie(30, new Normal());
  levels[6].addZombie(10, new Bucket());
  levels[6].addZombie(20, new Cone());
  
  levels[7] = new Level(275);
  levels[7].addZombie(30, new Bucket());
  levels[7].addZombie(25, new Normal());
  levels[7].addZombie(30, new Cone());
  levels[7].addZombie(25, new Normal());
  
  levels[8] = new Level(300);
  levels[8].addZombie(20, new Football());
  levels[8].addZombie(10, new Cone());
  levels[8].addZombie(10, new Bucket());
  
  levels[9] = new Level(350);
  levels[9].addZombie(30, new Normal());
  levels[9].addZombie(25, new Cone());
  levels[9].addZombie(15, new Bucket());
  levels[9].addZombie(10, new Football());
  levels[9].addZombie(5, new Gargantuar());
  
  //levels[10] = new Level(0);
  //levels[10].addZombie(1, new Normal());
  
}