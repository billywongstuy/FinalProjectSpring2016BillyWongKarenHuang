import java.util.*;

//font is Series Orbit
Square [][] area = new Square[68][68];
PImage map;
PImage bar;
PImage field;
PImage death;
PImage z1, z2, z3, z4, z5;
PFont text;
Plant plantChosen = null;
Plant plantShowing = null;
boolean surroundActive;
int sun = 300;
int health = 200;
List<Zombie> layout = new LinkedList<Zombie>();
Level[] levels = new Level[10];  //set up in setupLevels()
int ctr = 0;
boolean levelStarted = false;
float fastForward = 1;
boolean dead = false;

void setup() {
  size(800,800);
  fillField();
  noStroke();
  map = loadImage("../map.png");
  bar = loadImage("../Plants/plantsbar.png");
  field = loadImage("../field.png");
  death = loadImage("../goodbyebrains.png");
  z1 = loadImage("../Zombies/Normal.png");
  z2 = loadImage("../Zombies/Cone.png");
  z3 = loadImage("../Zombies/Bucket.png");
  z4 = loadImage("../Zombies/Football.png");
  z5 = loadImage("../Zombies/Gargantuar.png");
  image(map,0,0);
  text = loadFont("SeriesOrbit-16.vlw");
  textFont(text);
  setupLevels();
}


void draw() {
  image(map,0,0);
  textSize(16);
  fill(color(0,0,0));
  text(sun,686,68);
  text(health,746,68);
  stroke(0);
  strokeCap(PROJECT);
  strokeWeight(4);
  noFill();
  rect(675,510,120,50);
  if(!levelStarted){
    text("Start Level",691,540);
  }else{
    if(fastForward != 1){
      text("Normal Speed",681,540);
    }else{
      text("Fast Forward",681,540);
    }
  }
  showPlant();
  displayPlanted();
  deselect();  
  dragPlant();
  surroundChoice();
  checkZombieCond();
  displayZombies();
  displayCosts();
  moveZombies();
  plantsAttack();
  if(levelStarted && frameCount % (90 * fastForward) == 0){
    levels[ctr].spawn();
  }
  if(!dead && levelStarted && alive.isEmpty()){
    if(frameCount % (90 * fastForward) == 0){
        sun += levels[ctr].yield;
        ctr++;
        levelStarted = false;
        fastForward = 1;
    }
  }
  dead();
}

void mouseClicked() {
  if (mouseX >= 685 && mouseX <= 788 && mouseY >= 81 && mouseY <= 390) {
    plantShowing = null;
    selectPlant();  
  }
  //675,510,120,50
  else if (mouseX >= 675 && mouseY >= 510 && mouseY <= 560){
    if(!levelStarted && ctr < levels.length){
      levelStarted = true;
    }else if(fastForward == 1){
      fastForward = .5;
    }else{
      fastForward = 1;
    }
  }
  else if (mouseX >= 670 && mouseY >= 396 && mouseY <= 690) {
    fadeOut();
  }
  else if (plantChosen != null && validLocation() && enoughMoney() && mouseX < 680 && mouseY < 680) {
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
    if (mouseX < 680 && mouseY < 680 && area[mouseY/10][mouseX/10].getPlant() !=  null) {
      plantShowing = area[mouseY/10][mouseX/10].getPlant();
      
    }
  }
  //change
  //rect(15,745,130,38);
  else if (plantShowing != null && mouseX >= 15 && mouseX <= 145 && mouseY >= 745 && mouseY <= 783) {
    sell();  
  }
  else if (plantShowing != null && mouseX < 680 && mouseY < 680 && area[mouseY/10][mouseX/10].getPlant() == null) {
      plantShowing = null;  
  }
  else if (plantShowing != null && mouseX < 680 && mouseY < 680 && area[mouseY/10][mouseX/10].getPlant() != null && area[mouseY/10][mouseX/10].getPlant() != plantShowing) {
      plantShowing = area[mouseY/10][mouseX/10].getPlant(); 
  }
  else if (plantShowing != null && mouseX >= 230 && mouseX <= 505 && mouseY >= 690) {
    Upgrade u = plantShowing.upgrades[0].get(plantShowing.upgradeStatus[0]);
    if (plantShowing.upgradeStatus[0] <= 1 && sun >= u.cost) {
      sun -= u.cost;
      u.applyUpgrade(plantShowing);
      plantShowing.upgradeStatus[0] += 1;
    }
  }
  else if (plantShowing != null && mouseX >= 520 && mouseX <= 795 && mouseY >= 690) {
    Upgrade u = plantShowing.upgrades[1].get(plantShowing.upgradeStatus[1]);
    if (plantShowing.upgradeStatus[1] <= 1 && sun >= u.cost) {
      sun -= u.cost;
      u.applyUpgrade(plantShowing);
      plantShowing.upgradeStatus[1] += 1;
    }
  }
}

void dead(){
  if(health <= 0){
    image(death,0,0,800,800);
    alive = null;
    dead = true;
  }
}