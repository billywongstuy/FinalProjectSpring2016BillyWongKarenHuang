class Level{
  
 public Level() {
   
 }
  
 Queue<Zombie>zombies= new LinkedList<Zombie>(); 
 
 void spawn(){
   for(int i = 0;i < zombies.size();i++){
     //display(zombies.remove());
   }
 }
 
 void display(Zombie z){
   PImage photo = loadImage("../Zombies/" + z.getType() + ".png");
   image(photo,z.getCoords()[0],z.getCoords()[1]);
 }
 
 void addZombie(int n, Zombie z){
   for(int i = 0;i < n;i++){
     zombies.add(z);
   }
  }
}
void setupLevels(){
  Level Level1 = new Level();
  Level1.addZombie(20, new Normal());
  Level Level2 = new Level();
  Level2.addZombie(30, new Normal());
  Level Level3 = new Level();
  Level3.addZombie(20, new Normal());
  Level3.addZombie(5, new Cone());
}