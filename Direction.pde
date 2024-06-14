enum Direction{

  RIGHT(0), LEFT(1), DOWN(2), UP(3);
  
  final int dir;
  
  private Direction(int dir){
    this.dir = dir;
  }
  
  int getValue(){
    return dir;
  }

}
