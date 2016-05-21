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
int sun = 300;
int health = 200;
Level l1,l2,l3;


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
  System.out.println(path.size());
  //rect(480,120,10,10);*/
  setupLevels();
}


void draw() {
  image(map,0,0);
  fill(color(0,0,0));
  text(sun,686,68);
  showPlant();
  displayPlanted();
  deselect();  
  dragPlant();
  surroundChoice();
  displayZombies();
  if(frameCount % 50 == 0){
    l1.spawn();
  }
}

void mouseClicked() {
  if (mouseX < 680) {
  System.out.println(mouseY/10 + " " + mouseX/10);
  System.out.println(area[mouseY/10][mouseX/10].getPlant() != null);
  System.out.println(plantChosen);
  System.out.println(plantShowing);
  }
  if (mouseX >= 685 && mouseX <= 788 && mouseY >= 81 && mouseY <= 390) {
    plantShowing = null;
    selectPlant();  
  }
  else if (mouseX >= 670 && mouseY >= 396 && mouseY <= 690) {
    fadeOut();
  }
  else if (plantChosen != null && validLocation()) {
    area[mouseY/10][mouseX/10].placePlant(plantChosen); 
    if (!(plantChosen instanceof Spikeweed)) {
      plantChosen = null;
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