void makeRectangle(int x1, int y1, int x2, int y2) {
  fill(color(255,0,0));
  rect(x1,y1,x2-x1,2);
  rect(x1,y1,2,y2-y1);
  rect(x2,y1,2,y2-y1);
  rect(x1,y2,x2-x1,2);
}

void surroundChoice() {
  if (plantChosen != null && !surroundActive) {
    if (plantChosen instanceof Peashooter) {
      makeRectangle(685,81,733,147);    
    }
    if (plantChosen instanceof Gloomshroom) {
      makeRectangle(740,81,788,147);    
    }
    if (plantChosen instanceof Melonpult) {
      makeRectangle(685,162,733,228);    
    }
    if (plantChosen instanceof Bloomerang) {
      makeRectangle(740,162,788,228);    
    }
    if (plantChosen instanceof SnowPea) {
      makeRectangle(685,242,733,308);    
    }
    if (plantChosen instanceof Repeater) {
      makeRectangle(740,242,788,308);    
    }
    if (plantChosen instanceof Sunflower) {
      makeRectangle(685,324,733,390);    
    }
    if (plantChosen instanceof Spikeweed) {
      makeRectangle(740,324,788,390);    
    }
    surroundActive = true;
  }
}

void deselect() {
  //key == backspace
  if (plantChosen != null) {
    if (keyPressed && key == BACKSPACE) {
      fadeOut();  
    }
  }
}

void fadeOut() {
  plantChosen = null;
  surroundActive = false;
  image(bar,670,0);  
}

void selectPlant() {
  //add a flicker if not enough sun
  surroundActive = false;
  if (mouseX >= 685 && mouseX <= 733 && mouseY >= 81 && mouseY <= 147) {
    plantChosen = new Peashooter();    
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 81 && mouseY <= 147) { 
    plantChosen = new Gloomshroom();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 162 && mouseY <= 228) {
    plantChosen = new Melonpult();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 162 && mouseY <= 228) {
    plantChosen = new Bloomerang();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 242 && mouseY <= 308) {  
    plantChosen = new SnowPea();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 242 && mouseY <= 308) { 
    plantChosen = new Repeater();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 324 && mouseY <= 390) {
    plantChosen = new Sunflower();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 324 && mouseY <= 390) {
    plantChosen = new Spikeweed();
  }
  if (plantChosen.cost > sun) {
    plantChosen = null;  
  }
}


void dragPlant() {
  if (plantChosen != null) {   
    float radius = (float)(plantChosen.sRange);
    
    if (validLocation()) {fill(color(0,0,0,100));} else {fill(255,0,0,100);}
    stroke(0);
    ellipse(mouseX,mouseY,radius,radius);
    //PImage p = loadImage("../Plants/" + plantChosen.name + "1.png");
    //image(p,mouseX-15,mouseY-15);
    fill(color(128,128,128));
    ellipse(mouseX,mouseY,30,30);
    text(plantChosen.letter,mouseX,mouseY);
    surroundActive = false;   
  }
}


boolean validLocation() {
  int col = mouseX/10;
  int row = mouseY/10;
  for (int i = row-1; i <= row+1 && i < 68; i++) {
    for (int j = col-1; j <= col+1 && j < 68; j++) {
      try {
        if (!(plantChosen instanceof Spikeweed)) { 
          if (area[i][j] instanceof Road || (area[i][j] instanceof Soil && area[i][j].getPlant() != null)) {
            return false;  
          }
        }
        else {
          for (int k = row-1; k <= row+1; k++) {
            for (int l = col-1; l <= col+1; l++) {
              if (!(area[i][j] instanceof Road)) {
                return false;  
              }
            }
          }
        }
      }
      catch (Exception e) {}
    }
  }
  return true;
}

void showPlant() {
  if (plantShowing != null) {
    float x = (float)(plantShowing.range*10);
    fill(color(128,128,128,100));
    //need to fix the circle here for the coordinates
    ellipse(plantShowing.x,plantShowing.y,x,x);  
  }
}

boolean enoughMoney() {
  return plantChosen.cost <= sun;  
}