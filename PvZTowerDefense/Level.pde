class Level{
 LinkedList<Zombie>zombies= new LinkedList<Zombie>(); 
 
 public Level(LinkedList<Zombie>z){
   zombies = z;
 }
 
 void spawn(){
   for(int i = 0;i < zombies.size();i++){
     display(zombies.pop());
   }
 }
 
 void display(Zombie z){
   PImage photo = loadImage("../Zombies/" + z.getType() + ".png");
   image(photo,z.getCoords()[0],z.getCoords()[1]);
 }
}