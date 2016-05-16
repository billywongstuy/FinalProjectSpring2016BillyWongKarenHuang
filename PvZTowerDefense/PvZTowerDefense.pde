import java.util.*;

//font is Series Orbit
Square [][] area = new Square[68][68];
PImage map;
PImage bar;
PImage field;
PFont text;
Plant plantChosen = null;
boolean surroundActive;
//Treat the rows as y and cols as x for animation
int sun = 300;
int health = 200;
//testing 
/*
fill(color(161,119,79));
for (int i = 0; i < area.length; i++) {
    for (int j = 0; j < area[i].length; j++) {
      //System.out.println(area[i][j].getClass());
      //row: y
      //column: x
      
      if (area[i][j] != null && area[i][j].getClass() == new Road().getClass()) {
        System.out.println("yes");
        rect(j*10,i*10,10,10);
      }
    }
  }

*/

void setup() {
  size(800,800);
  fillField();
  noStroke();
  map = loadImage("../map.png");
  bar = loadImage("../Plants/plantsbar.png");
  field = loadImage("../field.png");
  image(map,0,0);
  text = loadFont("Serif.plain-18.vlw");
  textFont(text);
}


void draw() {
  image(map,0,0);
  fill(color(0,0,0));
  text(sun,686,68);
  displayPlanted();
  deselect();  
  dragPlant();
  surroundChoice();
  
}