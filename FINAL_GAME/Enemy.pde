class Enemy {  //naming the class

  // class variables
  float x;
  float y;
  int w;
  int h;
  float speed;  //how fast it changes between frames
  float scale;  // adjust how big animationis on the screen
  float index;  
  PImage image;

  //boundaries
  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;

  boolean isDead;
  boolean isAnimating;  //when true = will do one full animation, false it won't do anything

  //Constructor
 Enemy (float tempX, float tempY, int tempW, int tempH) {
   x = tempX;
   y = tempY;
   w = tempW;
   h = tempH;
   speed = 3;
   image = loadImage ("dementor_0.png");
  }
  
  void updateBounds () {
   topBound = y - h/2;
    bottomBound = y + h/2;
    leftBound = x - w/2;
    rightBound = x + w/2; 
  }
  void display() {
    //rect (x,y,w, h);
    rectMode (CENTER);
    //image(image, x,y, w, h);
  }
  
  void move (Player aPlayer) {
    if (aPlayer.x > x) {
      x += speed;
      println(x);
     
    }
    if (aPlayer.x < x) {
      x -= speed;
    
    }
    if (aPlayer.y > y) {
      y += speed;
     
    }
    if (aPlayer.y < y) {
      y -= speed;
      
    }
  }
  
  void isHit (Spell b1) {
    if (b1.topBound <= bottomBound) {
      if (b1.bottomBound >= topBound) {
        if (b1.leftBound <= rightBound) {
          if (b1.rightBound >= leftBound) {
            isDead = true;
          }
        }
      }
    }
  }
}
