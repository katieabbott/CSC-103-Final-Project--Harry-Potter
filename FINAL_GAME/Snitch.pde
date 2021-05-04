class Snitch {  //naming the class

  // class variables
  int x;
  int y;
  float size;
  float upspeed;
  float downspeed;
  float leftspeed;
  float rightspeed;
  PImage snitch;


  boolean hitSnitch;
  boolean isAnimating;

  //boundaries
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  boolean isMovingRight;
  boolean isMovingLeft;
  boolean isJumping;
  boolean isFalling;

  //constructor
  Snitch (int tempX, int tempY) {
    x = tempX;
    y = tempY;
    size = 30;
    upspeed = random (5,8);
    downspeed = 0;
    leftspeed = 0;
    rightspeed  = random (10,12);
    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;

    snitch = loadImage ("snitch_0.png");
  }

  void display () {
    
    //image (snitch, x, y);
  }

  void updateBounds () {
    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;
  }


  void move () {
    x += leftspeed;
    x += rightspeed;
    y += upspeed;
    y += downspeed;

    if (isMovingRight == true) {
      x += rightspeed;
      if (x >= width && rightBound >= width -size/2) {
        rightspeed = rightspeed * -1;
        println ("left");
      }
    }
    if (isMovingLeft == true) {
      x += leftspeed;
      if ( x <= width && leftBound == 0 + size/2) {
        leftspeed = leftspeed * -1;
      }
    }
    if (isJumping == true) {
      y += upspeed;
      if (y >= height && topBound == 0 + size/2) {
        upspeed = upspeed * -1;
      }
    }
    if (isFalling == true) {
      y += downspeed;
      if (y <= 0 && bottomBound >= height -size/2) {
        downspeed= downspeed * -1;
      }
    }
  }
   

  void isHit (Player p1, Score aScore) {
    if (topBound < p1.bottomBound && bottomBound > p1.topBound) {
      if (rightBound > p1.leftBound && leftBound < p1.rightBound) {
        hitSnitch = true;
        aScore.scoreSnitch ();
      }
    }
  }
}
