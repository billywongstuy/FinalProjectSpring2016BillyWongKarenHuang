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
  /*textSize(12);
  for (int i = 0; i < area.length; i++) {
    for (int j = 0; j < area[i].length; j++) {
      
      if (area[i][j] != null && area[i][j].getClass() == new Road().getClass()) {
        fill(color(161,119,79));
        rect(j*10,i*10,10,10);
        fill(color(0));
        if (area[i][j].startDistance != 0) {
        text((area[i][j].startDistance)%10,j*10,(i*10+10));
        }
      }
    }
  }
  //rect(480,120,10,10);*/
  setupLevels();
  //levels = {l1,l2,l3,ltest};
  //area[19][50].startDistance = 29;
  //area[19][49].startDistance = 29;
  //ltest.spawn();
  //l1.spawn();
}


void draw() {
  image(map,0,0);
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
  if(levelStarted && frameCount % 90 == 0){
    //System.out.println(ctr);
    //System.out.println(Arrays.toString(levels));
    if(ctr < levels.length){
      levels[ctr].spawn();
    }
  }
    if(levelStarted && alive.isEmpty() && frameCount % 90 == 0){
      sun += levels[ctr].yield;
      ctr++;
      levelStarted = false;
      fastForward = false;
  }
  System.out.println(fastForward);
}

void mouseClicked() {
  if (mouseX >= 685 && mouseX <= 788 && mouseY >= 81 && mouseY <= 390) {
    plantShowing = null;
    selectPlant();  
  }
  //675,510,120,50
  else if (mouseX >= 675 && mouseY >= 510 && mouseY <= 560){
    if(!levelStarted){
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