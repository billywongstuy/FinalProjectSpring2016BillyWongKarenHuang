void fillField() {
  for (int i = 0; i < 22; i++) {
    for (int j = 56; j < 62; j++) {
      area[i][j] = new Road();
    }
  }
  
  for (int a = 13; a < 22; a++) {
    for (int b = 46; b < 52; b++) {
       area[a][b] = new Road(); 
    }
  }
  
  for (int c = 16; c < 22; c++) {
    for (int d = 52; d < 56; d++) {
       area[c][d] = new Road(); 
    }
  }
  
  for (int k = 7; k < 13; k++) {
    for (int l = 6; l < 52; l++) {
      area[k][l] = new Road();
    }
  }
  
  for (int e = 13; e < 37; e++) {
    for (int f = 6; f < 12; f++) {
      area[e][f] = new Road();
    }
  }
  
  for (int g = 31; g < 37; g++) {
    for (int h = 12; h < 24; h++) {
       area[g][h] = new Road(); 
    }
  }
  
  for (int m = 21; m < 31; m++) {
    for (int n = 18; n < 24; n++) {
      area[m][n] = new Road();
    }
  }
  
  for (int o = 21; o < 27; o++) {
    for (int p = 24; p < 41; p++) {
      area[o][p] = new Road();  
    }
  }
  
  for (int q = 27; q < 51; q++) {
    for (int r = 35; r < 41; r++) {
      area[q][r] = new Road();
    }
  }
  
  for (int s = 45; s < 51; s++) {
    for (int t = 41; t < 51; t++) {
      area[s][t] = new Road();
    }
  }
  
  for (int u = 28; u < 45; u++) {
    for (int v = 46; v < 51; v++) {
      area[u][v] = new Road();
    }
  }
  
  for (int w = 28; w < 34; w++) {
    for (int x = 51; x < 62; x++) {
      area[w][x] = new Road();    
    }
  }
  
  for (int y = 34; y < 64; y++) {
   for (int z = 56; z < 62; z++) {
     area[y][z] = new Road();
   }
  }
  
  for (int a1 = 58; a1 < 64; a1++) {
    for (int b1 = 23; b1 < 56; b1++) {
       area[a1][b1] = new Road(); 
    }
  }
  
  for (int c1 = 47; c1 < 58; c1++) {
    for (int d1 = 23; d1 < 29; d1++) {
      area[c1][d1] = new Road();
    }
  }
  
  for (int e1 = 47; e1 < 53; e1++) {
    for (int f1 = 0; f1 < 23; f1++) {
      area[e1][f1] = new Road();
    }
  }
  
  for (int i = 0 ; i < 68; i++) {
    for (int j = 0; j < 68; j++) {
      if (area[i][j] == null) {
        area[i][j] = new Soil();  
      }
    }
  }
  
  //System.out.println(Arrays.deepToString(area));  
}


abstract class Square {
  Plant getPlant() {return null;};
  ArrayList<Zombie> getZombies() {return null;};
  boolean placePlant(Plant p) {return false;};
  void setPlant(Plant p) {};
  void setZombies(Zombie z) {};
}

class Road extends Square {
  ArrayList<Zombie>zombiesHere = new ArrayList<Zombie>();
  int numberSpikes = 0;
  
  ArrayList<Zombie> getZombies() {
    return zombiesHere;  
  }
  
  void setPlant(Plant p) {
    numberSpikes++;    
  }
  
  boolean placePlant(Plant p) {
    if (!validLocation()) {
      return false;  
    }
    int row = mouseY/10;
    int col = mouseX/10;
    for (int i = row-1; i < row+1 & i < 68; i++) {
      for (int j = col-1; j < col+1 && j < 68; j++) {
        area[i][j].setPlant(p); 
      }
    }
    planted.add(new Crop(p,row,col));
    return true;
  }
  
  void setZombies(Zombie z){
    zombiesHere.add(z);
    alive.add(z);
  }
  
}


class Soil extends Square {
  Plant plantHere;
  
  void setPlant(Plant p) {
    plantHere = p;  
  }
  
  boolean placePlant(Plant p) {
    if (!validLocation()) {
      return false;  
    }
    int row = mouseY/10;
    int col = mouseX/10;
    for (int i = row-1; i < row+1 & i < 68; i++) {
      for (int j = col-1; j < col+1 && j < 68; j++) {
        area[i][j].setPlant(plantChosen);  
      }
    }
    planted.add(new Crop(plantHere,row,col));
    return true;
  }
  
  Plant getPlant() {
    return plantHere;    
  }
}

ArrayList<Crop>planted = new ArrayList<Crop>();
ArrayList<Zombie>alive = new ArrayList<Zombie>();

class Crop {
  int row;
  int col;
  Plant p;
  
  public Crop(Plant pea, int r, int c) {
    row = r;
    col = c;
    p = pea;
  }
}

void displayPlanted() {
  for (Crop c: planted) {
    //fill(color(0,0,0));
    //ellipse(c.col*10,c.row*10,30,30); 
    PImage photo= loadImage("../Plants/" + c.p.name + "1.png");
    image(photo,c.col*10,c.row*10);
  }
}

void displayZombies(){
  for(Zombie z: alive){
   PImage photo = loadImage("../Zombies/" + z.getType() + ".png");
   image(photo,z.getCoords()[0]*10,z.getCoords()[1]*10);
  }
}