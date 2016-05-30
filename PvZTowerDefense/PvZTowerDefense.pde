import java.util.*;

//font is Series Orbit
Square [][] area = new Square[68][68];
PImage map;
PImage bar;
PImage field;
PFont text;
Plant plantChosen = null;
Plant plantShowing = null;
boolean surroundActive;
int sun = 9999;  //300
int health = 200;
List<Zombie> layout = new LinkedList<Zombie>();
Level l1,l2,l3,ltest;


void setup() {
  size(800,800);
  fillField();
  noStroke();
  map = loadImage("../map.png");
  bar = loadImage("../Plants/plantsbar.png");
  field = loadImage("../field.png");
  image(map,0,0);
  text = loadFont("SeriesOrbit-16.vlw");
  textFont(text);
  setupLevels();
  //for (Square r: path) {
  //  System.out.print(Arrays.toString(r.coords) + " ");  
  //}
  //ltest.spawn();
  //for (int i = 0; i < 10; i++) {
  //moveZombies();
  //}
}


void draw() {
  image(map,0,0);
  fill(color(0,0,0));
  text(sun,686,68);
  text(health,746,68);
  showPlant();
  displayPlanted();
  deselect();  
  dragPlant();
  surroundChoice();
  checkZombieCond();
  displayZombies();
  moveZombies();
  plantsAttack();
  if(frameCount % 90 == 0){
    ltest.spawn();
  }
}

void mouseClicked() {
  if (mouseX >= 685 && mouseX <= 788 && mouseY >= 81 && mouseY <= 390) {
    plantShowing = null;
    selectPlant();  
  }
  else if (mouseX >= 670 && mouseY >= 396 && mouseY <= 690) {
    fadeOut();
  }
  else if (plantChosen != null && validLocation() && enoughMoney() && mouseX < 680) {
    area[mouseY/10][mouseX/10].placePlant(plantChosen); 
    sun -= plantChosen.cost;
    if (!(plantChosen instanceof Spikeweed)) {
      plantChosen = null;
    }
    else {
      plantChosen = new Spikeweed();  
    }
  }
  else if (plantChosen == null && plantShowing == null) {
    if (mouseX < 680 && area[mouseY/10][mouseX/10].getPlant() !=  null) {
      plantShowing = area[mouseY/10][mouseX/10].getPlant();
      
    }
  }
  else if (plantShowing != null && area[mouseY/10][mouseX/10].getPlant() == null) {
      plantShowing = null;  
  }
  else if (plantShowing != null && area[mouseY/10][mouseX/10].getPlant() != null && area[mouseY/10][mouseX/10].getPlant() != plantShowing) {
      plantShowing = area[mouseY/10][mouseX/10].getPlant(); 
  }
}