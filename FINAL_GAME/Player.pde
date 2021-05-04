class Player {  //naming the class

  // class variables
  //variables

  int x;
  int y;
  int size;
  PImage harry;
  int speed;

  //int leftspeed;
  //int  rightspeed;
  //int upspeed;
  //int downspeed;


  //boundaries
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  boolean isMovingRight;
  boolean isMovingLeft;
  boolean isJumping;
  boolean isFalling;

  boolean isCollideUp;
  boolean isCollideLeft;
  boolean isCollideDown;
  boolean isCollideRight;

  boolean isFacingLEFT;

  boolean isInAzkaban;

  boolean isHit;

  //constructor
  Player () {
    x = 100;
    y = 500;
    size = 100;

    speed = 20;

    isMovingRight = false;
    isMovingLeft = false;
    isJumping = false;
    isFalling = false;

    isCollideUp = false;
    isCollideLeft = false;
    isCollideDown = false;
    isCollideRight = false;

    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;

    harry = loadImage ("harry0.png");
  }

  void display() {

    rectMode (CENTER);

    topBound = y - size/2;
    bottomBound = y + size/2; 
    leftBound = x - size/2;
    rightBound = x + size/2;
  }

  void up() {
    if (isCollideUp == false) {
      y -= speed;
    }
  }
  void left() {
    if (isCollideLeft == false) {
      x -= speed;
    }
  }
  void down() {
    if (isCollideDown == false) {
      y += speed;
    }
  }
  void right() {
    if (isCollideRight == false) {
      x += speed;
    }
  }

  void move () {
    if (isMovingRight == true) {
      if (x <= width - size/2) {
        right ();
      }
    }
    if (isMovingLeft == true) {
      if (x >= size/2) {
        isFacingLEFT = true;
        left ();
      }
    }
    if (isJumping == true) {
      if (y >= size/2) {
        up ();
      }
    }
    if (isFalling == true) {
      if (y <= height -size/2) {
        down ();
      }
    }
  }

  void resetPosition () {
    x =0 + size;
    y = height/2;
    speed = 20;
  }


  void updateBounds () {
    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;
  }

  void beingHit (Enemy anEnemy) {   //being Hit means that when the Enemy hits the player, the score goes down
    // println(anEnemy);
    if (anEnemy.topBound <= bottomBound) {
      if (anEnemy.bottomBound >= topBound) {
        if (anEnemy.leftBound <= rightBound) {
          if (anEnemy.rightBound >= leftBound) {
            isInAzkaban = true;
          }
        }
      }
    }
  }

  void collision (Obstacles anObstacle, Score aScore) {
    if (topBound < anObstacle.bottomBound && bottomBound > anObstacle.topBound) {
      if (rightBound > anObstacle.leftBound && leftBound < anObstacle.rightBound) {
        if (isMovingRight == true) {
          isMovingRight = false;
          x = x - 2 * speed;
          mandrakeSound.play ();
          aScore.hitMandrake ();
          isHit = true;
        } else if (isMovingLeft == true) {
          isMovingLeft = false;
          x = x + 2 * speed;
        } else if (isJumping == true) {
          isJumping = false;
          y = y +2*speed;
        } else if (isFalling == true) {
          isFalling = false;
          y = y - 2 * speed;
        }
      }
    }
  }
}
