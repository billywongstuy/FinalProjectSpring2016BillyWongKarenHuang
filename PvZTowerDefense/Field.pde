ArrayList<Square>path = new ArrayList<Square>();
ArrayList<Crop>planted = new ArrayList<Crop>();
ArrayList<Zombie>alive = new ArrayList<Zombie>();

void fillField() {
  int start = 1;
  
  for (int i = 0; i < 22; i++) {
    for (int j = 56; j < 61; j++) {
      if (j == 58 && i <= 19) {
        area[i][j] = new Road(start,i,j);   
        path.add(area[i][j]);
        start++;
      }
      else {
        area[i][j] = new Road();  
      }
    }
  }
  
  
  //d from 510-560
  for (int c = 17; c < 22; c++) {
    for (int d = 57; d >= 49; d--) {
      if (c == 19) {  
         area[c][d] = new Road(start,c,d); 
         path.add(area[c][d]);
         start++;   
      }
      else {
        area[c][d] = new Road();  
      }
    }
  }
  
  //a from 21 to 12
  for (int a = 21; a >= 10; a--) {
    for (int b = 46; b < 49; b++) {
      if (b == 48 && a <= 19 && a >= 9) {
       area[a][b] = new Road(start,a,b);
       path.add(area[a][b]);
       start++;
      }
      else {
        area[a][b] = new Road();  
      }
    }
  }
  
  area[9][48] = new Road(start,9,48);
  path.add(area[9][48]);
  start++;
  
  for (int k = 11; k >= 7; k--) {
    for (int l = 47; l >= 6; l--) {
      if (k == 9 && l <= 48 && l >= 8) {
        area[k][l] = new Road(start,k,l);
        path.add(area[k][l]);
        start++;
      }
      else {
        area[k][l] = new Road();    
      }
    }
  }
  
  for (int e = 10; e < 36; e++) {
    for (int f = 6; f < 11; f++) {
      if (f == 8 && e <= 33) { 
        area[e][f] = new Road(start,e,f);
        path.add(area[e][f]);
        start++;
      }
      else {
        area[e][f] = new Road();  
      }
    }
  }
  
  for (int g = 31; g < 36; g++) {
    for (int h = 9; h < 23; h++) {
       if (g == 33 && h <= 20) { 
        area[g][h] = new Road(start,g,h);
        path.add(area[g][h]);
        start++;
      }
      else {
        area[g][h] = new Road();  
      }
    }
  }
  
  for (int m = 32; m >= 22; m--) {
    for (int n = 18; n < 23; n++) {
      if (n == 20 && m >= 24) { 
        area[m][n] = new Road(start,m,n);
        path.add(area[m][n]);
        start++;
      }
      else {
        area[m][n] = new Road();  
      }
    }
  }
  
  for (int o = 22; o < 27; o++) {
    for (int p = 21; p < 40; p++) {
      if (o == 24 && p <= 37) { 
        area[o][p] = new Road(start,o,p);
        path.add(area[o][p]);
        start++;
      }
      else {
        area[o][p] = new Road();  
      }
    }
  }
  
  for (int q = 25; q < 50; q++) {
    for (int r = 35; r < 40; r++) {
      if (r == 37 && q <= 47) { 
        area[q][r] = new Road(start,q,r);
        path.add(area[q][r]);
        start++;
      }
      else {
        area[q][r] = new Road();  
      }
    }
  }
  
  for (int s = 45; s < 50; s++) {
    for (int t = 38; t < 51; t++) {
      if (s == 47 && t <= 48) { 
        area[s][t] = new Road(start,s,t);
        path.add(area[s][t]);
        start++;
      }
      else {
        area[s][t] = new Road();  
      }
    }
  }
  
  for (int u = 46; u >= 28; u--) {
    for (int v = 46; v < 51; v++) {
      if (v == 48 && u >= 30) { 
        area[u][v] = new Road(start,u,v);
        path.add(area[u][v]);
        start++;
      }
      else {
        area[u][v] = new Road();  
      }
    }
  }
  
  for (int w = 28; w < 33; w++) {
    for (int x = 49; x < 62; x++) {
      if (w == 30 && x <= 59) { 
        area[w][x] = new Road(start,w,x);
        path.add(area[w][x]);
        start++;
      }
      else {
        area[w][x] = new Road();  
      }
    }
  }
  
  for (int y = 31; y < 63; y++) {
   for (int z = 57; z < 62; z++) {
     if (z == 59 && y <= 60) { 
        area[y][z] = new Road(start,y,z);
        path.add(area[y][z]);
        start++;
      }
      else {
        area[y][z] = new Road();  
      }
   }
  }
  
  for (int a1 = 58; a1 < 63; a1++) {
    for (int b1 = 58; b1 >= 23; b1--) {
       if (a1 == 60 && b1 >= 25) { 
        area[a1][b1] = new Road(start,a1,b1);
        path.add(area[a1][b1]);
        start++;
      }
      else {
        area[a1][b1] = new Road();  
      }
    }
  }
  
  for (int c1 = 59; c1 >= 48; c1--) {
    for (int d1 = 23; d1 < 29; d1++) {
      if (d1 == 25 && c1 >= 50) { 
        area[c1][d1] = new Road(start,c1,d1);
        path.add(area[c1][d1]);
        start++;
      }
      else {
        area[c1][d1] = new Road();  
      }
    }
  }
  
  for (int e1 = 48; e1 < 53; e1++) {
    for (int f1 = 24; f1 >= 0; f1--) {
      if (e1 == 50) { 
        area[e1][f1] = new Road(start,e1,f1);
        path.add(area[e1][f1]);
        start++;
      }
      else {
        area[e1][f1] = new Road();  
      }
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


abstract class Square{
  int startDistance;
  int[] coords = new int[2];
  Plant getPlant() {return null;};
  ArrayList<Zombie> getZombies() {return null;};
  boolean placePlant(Plant p) {return false;};
  void setPlant(Plant p) {};
  void setZombies(Zombie z) {};
  void removeZombie (Zombie z) {};
  Square next() {return null;};
  int[] getCoords(){return null;};
}

class Road extends Square {
  ArrayList<Zombie>zombiesHere = new ArrayList<Zombie>();
  int numberSpikes = 0;
  
  public Road() {}
  
  public Road(int i,int x,int y) {
    startDistance = i;
    coords[0] = x;
    coords[1] = y;
  }
  
  int[] getCoords(){
    return coords;
  }
   
  Square next() {
    return path.get(startDistance+1);  
  }
  
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
    p.setX();
    p.setY();
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
    //alive.add(z);
  }
  
  void removeZombie(Zombie z) {
    zombiesHere.remove(zombiesHere.indexOf(z));  
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
    int row = (mouseY-15)/10;
    int col = (mouseX-15)/10;
    p.setX(col);
    p.setY(row);
    for (int i = row; i <= row+2 & i < 68; i++) {
      for (int j = col; j <= col+2 && j < 68; j++) {
        area[i][j].setPlant(plantChosen);  
      }
    }
    planted.add(new Crop(p,row,col));
    System.out.println("Planted at " + row + "," + col);
    return true;
  }
  
  
  
  Plant getPlant() {
    return plantHere;    
  }
}



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
    fill(color(0,0,0));
    if (c.p.getClass() == new Sunflower().getClass()) {
      if(fastForward){
        if(frameCount % 90 == 0){
          fill(color(255,255,0));
        }
      }else{
        if (frameCount % 180 == 0) {
          fill(color(255,255,0));  
        }
      }
    }
    //rect(c.col*10,c.row*10,30,30);
    ellipse(c.col*10+15,c.row*10+15,30,30); 
    fill(color(255,255,255));
    textSize(16);
    text(c.p.letter,c.col*10+15,c.row*10+15);
    //PImage photo= loadImage("../Plants/" + c.p.name + "1.png");
    //image(photo,c.col*10,c.row*10);
    
  }
}



void checkZombieCond() {
  ArrayList<Zombie>toDie = new ArrayList<Zombie>();
  for(int i = 0; i < alive.size(); i++){
    Zombie z = alive.get(i);
    if (z.coords[0] == 67) {
    }
    if (z.health <= 0) {
      toDie.add(z);
    }
  }
  for (int j = 0; j < toDie.size(); j++) {
    toDie.get(j).die();    
  }
}


void displayZombies(){
  for(Zombie z: alive){    
    fill(color(1,1,1));
    if (z.slow != 1) {
      fill(color(0,0,250));  
    }
    //ellipse(z.coords[1]*10+5,z.coords[0]*10+5,30,30);
    //fill(color(255,255,255));
    //text(z.health,z.coords[1]*10+5,z.coords[0]*10+5);
    PImage photo= loadImage("../Zombies/" + z.type + ".png");
    image(photo,z.coords[1]*10 - 50,z.coords[0]*10 - 70);
  }
}


void moveZombies() {
  ArrayList<Zombie>toRemove = new ArrayList<Zombie>();
  for (Zombie z: alive) {
    if (z.slowTimer > 0) {
      z.slowTimer--;  
    }
    if (z.slowTimer == 0) {
      z.slow = 1;  
    }
    if(fastForward){
      if(frameCount % ((50*z.slow)/2) == 0){
        if (!z.move()) {
          health -= z.health;
          toRemove.add(z);
        }
      }
    }else{
      if (frameCount % (50*z.slow) == 0) {
        if (!z.move()) {
          health -= z.health;
          toRemove.add(z);
        }
      }  
    }
  }
  //System.out.println();
  for (Zombie z: toRemove) {
    alive.remove(alive.indexOf(z));  
  }
}

void plantsAttack() {
  for (int i = 0; i < planted.size(); i++) {
    Crop c = planted.get(i);
    c.p.attack();  
  }
}