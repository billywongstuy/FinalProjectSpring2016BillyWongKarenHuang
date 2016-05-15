void makeRectangle(int x1, int y1, int x2, int y2) {
  fill(color(255,0,0));
  rect(x1,y1,x2-x1,2);
  rect(x1,y1,2,y2-y1);
  rect(x2,y1,2,y2-y1);
  rect(x1,y2,x2-x1,2);
}

void surroundChoice() {
  if (plantChosen != null && !surroundActive) {
    image(bar,670,0);
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

void mouseClicked() {
  if (mouseX >= 685 && mouseX <= 788 && mouseY >=81 && mouseY <= 390) {
    selectPlant();  
  }
  else if (mouseX >= 670 && mouseY >= 396 && mouseY <= 690) {
    fadeOut();
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
  System.out.println("No plant");  
  plantChosen = null;
  surroundActive = false;
  image(bar,670,0);  
}

void selectPlant() {
  surroundActive = false;
  if (mouseX >= 685 && mouseX <= 733 && mouseY >= 81 && mouseY <= 147) {
    System.out.println("Peashooter"); 
    plantChosen = new Peashooter();    
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 81 && mouseY <= 147) {
    System.out.println("Gloom");  
    plantChosen = new Gloomshroom();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 162 && mouseY <= 228) {
    System.out.println("Melon"); 
    plantChosen = new Melonpult();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 162 && mouseY <= 228) {
    System.out.println("Bloomerang");  
    plantChosen = new Bloomerang();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 242 && mouseY <= 308) {
    System.out.println("Snow Pea");  
    plantChosen = new SnowPea();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 242 && mouseY <= 308) {
    System.out.println("Repeater");  
    plantChosen = new Repeater();
  }
  else if (mouseX >= 685 && mouseX <= 733 && mouseY >= 324 && mouseY <= 390) {
    System.out.println("Sunflower");  
    plantChosen = new Sunflower();
  }
  else if (mouseX >= 740 && mouseX <= 788 && mouseY >= 324 && mouseY <= 390) {
    System.out.println("Spikeweed");  
    plantChosen = new Spikeweed();
  }
}


void dragPlant() {
  if (plantChosen != null) {
      
  }
}