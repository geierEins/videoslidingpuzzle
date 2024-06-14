TileController tc;

void setup() {
  size(1000, 1000);
  background(15);
  tc = new TileController(4);
  //tc.logTileInfos();
  tc.shuffleTilesNTimes(300);
}

void draw() {

  tc.showTiles();
  //tc.printInfo();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      tc.move("UP");
    }
    if (keyCode == RIGHT) {
      tc.move("RIGHT");
    }
    if (keyCode == DOWN) {
      tc.move("DOWN");
    }
    if (keyCode == LEFT) {
      tc.move("LEFT");
    }
  }
  if (key == 's') {
    tc.shuffleTilesNTimes(100);
  }
}
