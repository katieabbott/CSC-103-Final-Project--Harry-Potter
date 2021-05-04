class Door {

  //variable
  int x;
  int y;
  int w;
  int h;
  color aColor;

  // boundaries
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  //boolean
  boolean isDoorCollide;

  //Constructor
  Door () {
    x = width - 10;
    y = height/2 + 5;
    w = 50;
    h= 100;
    topBound = y - h/2;
    bottomBound = y + h/2;
    leftBound = x - w/2;
    rightBound = x + w/2;;
    aColor = color (#8E7B7B);
  }

  void render () {
    fill (aColor);
    rect (x, y, w, h);
    
  }
  void doorHit (Player p1 ) {
    if (bottomBound >= p1.topBound) {
      if (p1.bottomBound >= topBound) {
        if (p1.leftBound <= rightBound) {    
          if (p1.rightBound >= leftBound) {
            isDoorCollide = true;
          }
        }
      }
    }
  }
}
