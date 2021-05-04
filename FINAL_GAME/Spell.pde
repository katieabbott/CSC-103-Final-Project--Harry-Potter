class Spell {  //naming the class

  //class variables
  int x;  // x position of the spell
  int y; // y position of the spell
  int d; // diameter of the spell

  int xSpeed; // x speed of the spell
  int ySpeed; // y speed of the spell
  
  //boundaries
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  
  boolean spellBurst;

  //Constructor

  Spell (int theX, int theY) { //contructing a class
    x = theX; // new variable from class
    y = theY; // new variable from class
    d = 25;   // diameter of spell
    xSpeed = 15; //set x speed
    ySpeed = 0; // set y speed
    spell = loadImage ("spell.png");
    topBound = y - d/2;
    bottomBound = y + d/2;
    leftBound = x - d/2;
    rightBound = x + d/2;
    
  }
  void render () {  //color and shape of spell
    image (spell, x, y);
    //circle(x,y,d);
  }


  void move () { //move spell 
    x += xSpeed;
//if (xSpeed >=0) {
//      xSpeed = xSpeed + 1 ;
//    } 
    y += ySpeed;
  }
  
  void updateBounds () {
    topBound = y - d/2;
    bottomBound = y + d/2 ;
    leftBound = x - d/2;
    rightBound = x + d/2;
    
  }

  void spellBurst () {  //Spell disappears once it hits the enemy
    if ( x >= width - d/2){
      spellBurst = true;
    }
  }
}
