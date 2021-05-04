class Obstacles {  //naming the class

  // class variables
  float x;
  float y; 
  int size;
  int c;

  // boundaries
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

PImage mandrakeimage;
boolean isAnimating;

  //Constructor
  Obstacles (float theX, float theY, int theSize) {
    x = theX;
    y = theY;
    size = theSize;
    mandrakeimage = loadImage ("mandrake_0.png");
    
    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;
  }
  void display () {
    image (mandrakeimage, x, y);
    rectMode (CENTER);
  }
}
