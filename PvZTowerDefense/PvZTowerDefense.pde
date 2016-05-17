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
    if (area[mouseY/10][mouseX/10].getPlant() !=  null) {
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