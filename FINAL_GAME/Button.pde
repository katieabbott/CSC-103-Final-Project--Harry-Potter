class Button {  //naming the class

  //Button variables
  int x;
  int y;
  int size;
  int aColor;
  
  boolean isPressed;
  boolean isBetween;
  boolean isInButton;
  
  //constructor

  Button (int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    aColor = color (#B45656);
    
  }

  void render () {
    rectMode(CORNER);
    fill (aColor);
    square (x, y, size);
  }
  
  boolean isBetween ( int aVal, int firstBound, int secondBound) {
    if (aVal >= firstBound && aVal <= secondBound) {
      return true;
    } else {
      return false;
    }
    
  }

  boolean isInButton () {
    if (isBetween (mouseX, x, x + size) && isBetween (mouseY, y, y + size)) {
      return true;
    } else {
      return false;
    }
  }
  
    boolean isPressed() {
    if (isInButton () && mousePressed == true) {
      return true;
    } else { 
      return false;
    }
  }
}
