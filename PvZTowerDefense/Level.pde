class Level{
  
 public Level() {
   
 }
  
 List<Zombie>zombies= new LinkedList<Zombie>(); 
 
 void spawn(){
   for(int i = 0;i < zombies.size();i++){
     area[zombies.get(i).getCoords()[0]][zombies.get(i).getCoords()[1]].setZombies(zombies.get(i));
     zombies.get(i).move();
   }
 }
 
 void addZombie(int n, Zombie z){
   for(int i = 0;i < n;i++){
     zombies.add(z);
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
}