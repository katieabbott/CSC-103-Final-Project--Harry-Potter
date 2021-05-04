class Score {  //naming the class

  // class variables
  int numberScore; //hit dementor +100
  
  //Constructor
  Score () {
    numberScore = 0;
    
  }
  
  
  //snitch +1000
 
  void scoreSnitch () {
    numberScore += 1000;
  }
  
  void hitMandrake () {
    numberScore -=100;
  }

  void incS () {
    numberScore += 100;
  }
  void level () {
    numberScore += 500;
  }
  
  void display () {
    textSize (50);
    text (numberScore, width/2, 700);
  }

  // make function to increase score
  // call function whenever isDead is true (setup and draw)
}
