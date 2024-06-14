import processing.video.*;

class TileController {

  Capture sourceVideo;
  Tile[][] tiles;
  int numPerSide;
  PVector emptySpot;

  TileController(int numPerSide) {
    emptySpot = new PVector(0, 0);
    sourceVideo = new Capture(videoslidingpuzzle.this, width, height);
    this.numPerSide = numPerSide;
    tiles = new Tile[numPerSide][numPerSide];
    sourceVideo.start();
    buildTiles();
  }

  void buildTiles() {
    int index = 0;
    for (int j = 0; j < numPerSide; j++) {
      for (int i = 0; i < numPerSide; i++) {
        tiles[i][j] = new Tile(index, sourceVideo,
          i*(width/numPerSide), j*(height/numPerSide),
          width/numPerSide);
        index++;
      }
    }
    tiles[(int)emptySpot.x][(int)emptySpot.y].switchToDark();
  }

  void showTiles() {
    for (int i=0; i < numPerSide; i++) {
      for (int j=0; j < numPerSide; j++) {
        tiles[i][j].showTile();
      }
    }
  }

  void swapTiles(Tile t1, Tile t2) {
  }

  void swapTwoTiles(int t1i, int t1j, int t2i, int t2j) {
    if (t1i >= numPerSide || t1j >= numPerSide
      || t2i >= numPerSide || t2j >= numPerSide) {
      println("can't swap. tile i- and/or j- value(s) are out of tiles array range.");
      return;
    }
    if (t1i < 0 || t1j < 0 || t2i < 0 || t2j < 0) {
      println("can't swap. tile i- and/or j- value(s) are lower zero.");
      return;
    }
    if (t1i == t2i && t1j == t2j) {
      return;
    }
    // swap x- & y- coordinates
    float t1xTemp = tiles[t1i][t1j].x;
    float t1yTemp = tiles[t1i][t1j].y;
    tiles[t1i][t1j].setXY(tiles[t2i][t2j].x, tiles[t2i][t2j].y);
    tiles[t2i][t2j].setXY(t1xTemp, t1yTemp);

    // swap order in array
    Tile t1Temp = tiles[t1i][t1j];
    tiles[t1i][t1j] = tiles[t2i][t2j];
    tiles[t2i][t2j] = t1Temp;
  }

  void shuffleTilesNTimes(int n) {
    for (int i = 0; i < n; i++) {
      int num = (int)random(5);
      switch(num) {
      case 0 :
        move("UP");
        break;
      case 1 :
        move("DOWN");
        break;
      case 2 :
        move("LEFT");
        break;
      case 3 :
        move("RIGHT");
        break;
      }
    }
  }

  void move(String direction) {
    if (isValidMove(direction)) {
      switch(direction) {
      case "RIGHT" :
        swapTwoTiles((int)emptySpot.x, (int)emptySpot.y, ((int)emptySpot.x)-1, (int)emptySpot.y);
        emptySpot.x-=1;
        break;
      case "LEFT" :
        swapTwoTiles((int)emptySpot.x, (int)emptySpot.y, ((int)emptySpot.x)+1, (int)emptySpot.y);
        emptySpot.x+=1;
        break;
      case "DOWN" :
        swapTwoTiles((int)emptySpot.x, (int)emptySpot.y, (int)emptySpot.x, ((int)emptySpot.y)-1);
        emptySpot.y-=1;
        break;
      case "UP" :
        swapTwoTiles((int)emptySpot.x, (int)emptySpot.y, (int)emptySpot.x, ((int)emptySpot.y)+1);
        emptySpot.y+=1;
        break;
      }
    }
  }

  boolean isValidMove(String direction) {
    switch(direction) {
    case "RIGHT" :
      if ((emptySpot.x - 1) >= 0) return true;
      break;
    case "LEFT" :
      if ((emptySpot.x + 1) < numPerSide) return true;
      break;
    case "DOWN" :
      if ((emptySpot.y - 1) >= 0) return true;
      break;
    case "UP" :
      if ((emptySpot.y + 1) < numPerSide) return true;
      break;
    }
    println(direction + " NO VALID MOVE");
    return false;
  }

  void logTileInfos() {
    for (int i=0; i < numPerSide; i++) {
      for (int j=0; j < numPerSide; j++) {
        tiles[i][j].logInfo();
      }
    }
  }

  void printInfo() {
    println("----------------------");
    //println("emptySpot.x: " + emptySpot.x);
    //println("emptySpot.y: " + emptySpot.y);

    println("tiles[0][0].x: " + tiles[0][0].x);
    println("tiles[0][0].y: " + tiles[0][0].y);
  }
}
