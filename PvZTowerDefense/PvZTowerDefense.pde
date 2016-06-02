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
Level[] levels = new Level[4];  //set up in setupLevels()
int ctr = 0;
boolean levelStarted = false;
boolean fastForward = false;

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
    text("Fast Forward",681,540);
  }
  showPlant();
  displayPlanted();
  deselect();  
  dragPlant();
  surroundChoice();
  checkZombieCond();
  displayZombies();
  moveZombies();
  plantsAttack();
  if(fastForward){
    if(levelStarted && frameCount % 45 == 0){
      levels[ctr].spawn();
    }
  }else{
    if(levelStarted && frameCount % 90 == 0){
      //System.out.println(ctr);
      //System.out.println(Arrays.toString(levels));
        levels[ctr].spawn();
    }
  }
  if(levelStarted && alive.isEmpty()){
    if(!fastForward){
      if(frameCount % 90 == 0){
        sun += levels[ctr].yield;
        ctr++;
        levelStarted = false;
        fastForward = false;
      }
    }else{
      if(frameCount % 45 == 0){
        sun += levels[ctr].yield;
        ctr++;
        levelStarted = false;
        fastForward = false;
      }
    }
  }
  //System.out.println(fastForward);
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
    }else if(!fastForward){
      fastForward = true;
    }else{
      fastForward = false;
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
}