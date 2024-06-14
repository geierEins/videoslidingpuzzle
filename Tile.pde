class Tile {

  Capture srcVideo;
  final int index;
  boolean isDark;
  float x, y, w;
  final float xSrc, ySrc;

  Tile(int index, Capture srcVideo, float x, float y, float w) {
    this.index = index;
    this.srcVideo = srcVideo;
    this.x = x;
    this.xSrc = x;
    this.y = y;
    this.ySrc = y;
    this.w = w;
    this.isDark = false;
  }

  void showTile() {
    if (!isDark) {
      if (srcVideo.available() == true) {
        srcVideo.read();
      }
      copy(srcVideo, (int)xSrc, (int)ySrc, (int)w, (int)w,
        (int)x, (int)y, (int)w, (int)w);
    }else{
      fill(15);
      noStroke();
      rect(x, y, w, w);
    }

    noFill();
    stroke(255);
    strokeWeight(1);
    //rect(x, y, w, w);
    fill(255, 150);
    textSize(70);
    text(index, x+w/2, y+w/2);
  }

  void setWidth(float w) {
    this.w = w;
  }

  void setXY(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void switchToDark() {
    this.isDark = true;
  }

  void logInfo() {
    println("x: " + x);
    println("y: " + y);
    println("-------------");
  }
}
