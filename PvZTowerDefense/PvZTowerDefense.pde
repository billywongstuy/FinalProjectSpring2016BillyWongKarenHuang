//font is Series Orbit
Square [][] area = new Square[68][68];
PImage map;
PImage bar;
PImage field;
Plant plantChosen = null;
boolean surroundActive;
//Treat the rows as y and cols as x for animation


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
  size(900,900);
  fillField();
  noStroke();
  map = loadImage("../map.png");
  bar = loadImage("../Plants/plantsbar.png");
  field = loadImage("../field.png");
  image(map,0,0);
 
}


void draw() {
  deselect();  
  surroundChoice();

  
}