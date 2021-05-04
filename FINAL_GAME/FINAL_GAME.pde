import processing.sound.*;

SoundFile bulletSound;
SoundFile backgroundSong;
SoundFile mandrakeSound;
SoundFile winSound;

//Background image
PImage bg;

Animation image;
Animation dementorAnimation;
Animation imageLEFT;
Animation snitchAnimation;
Animation mandrakeAnimation;

//animation
PImage harry ;
PImage dementor ;

//pictures
PImage spell;
PImage Letter;
PImage Azkaban;


// array to hold animation
PImage [] harryimage = new PImage  [2];
PImage [] dementorimage = new PImage [2];
PImage [] harryimageLEFT = new PImage [2];
PImage [] snitchimage = new PImage [2];
PImage [] mandrakeimage = new PImage [2];

//make ArrayList for spells and enemies
ArrayList <Spell> spellList; 
ArrayList <Enemy> enemyList;
ArrayList <Snitch> snitchList;
ArrayList <Obstacles> mandrakeList;


//values 
Player p1;
Score aScore;
Obstacles anObstacle;
Button button1;
Door d1;
Door d2;
Door d3;
Snitch aSnitch;
Spell b1;

int switchVal; //Switch Variable for states

void setup () {
  size (1000, 800);
  bg = loadImage ("castlefloor.jpeg");


  // sound
  bulletSound = new SoundFile (this, "bulletSound.wav");
  bulletSound.rate(1.5);
  bulletSound.amp (0.5);

  backgroundSong = new SoundFile (this, "harrypotter.wav");

  mandrakeSound = new SoundFile (this, "mandrakeSound.wav");
  
  winSound = new SoundFile (this, "win.wav");


  // import new player
  p1 = new Player ();  //import Harry Potter image

  //door 
  d1 = new Door ();
  d2 = new Door ();
  d3 = new Door ();

  //Set up an array for spells
  spellList = new ArrayList <Spell> ();
  //Set up an array list for enemies
  enemyList = new ArrayList <Enemy> ();
  //Set up an array list for snitch
  snitchList = new ArrayList <Snitch> ();
  // Set up an array list for mandrake
  mandrakeList = new ArrayList <Obstacles> ();


  aScore = new Score ();
  button1 = new Button (475, 650, 75);    //Make a new BUTTON



  //load images and put them in an array
  for (int i=0; i <harryimage.length; i++) {
    harryimage [i] = loadImage ("harry"+i+".png");
  }
  for (int i=0; i <dementorimage.length; i++) {
    dementorimage [i] = loadImage ("dementor_"+i+".png");
  }
  for (int i=0; i <harryimageLEFT.length; i++) {
    harryimageLEFT [i] = loadImage ("harrycopy_"+i+".png");
  }
  for (int i=0; i <snitchimage.length; i++) {
    snitchimage [i] = loadImage ("snitch_"+i+".png");
  }
  for (int i=0; i <mandrakeimage.length; i++) {
    mandrakeimage [i] = loadImage ("mandrake_"+i+".png");
  }

  //initialize harry potter
  image = new Animation (harryimage, 0.1, .8);
  dementorAnimation = new Animation (dementorimage, 0.005, 1.2);
  snitchAnimation = new Animation (snitchimage, 0.1, 1);
  imageLEFT = new Animation (harryimageLEFT, 0.1, 1);
  mandrakeAnimation = new Animation (mandrakeimage, 0.1, 1);
  switchVal =1; //switch states one at a time
}

void draw () {

  // draw image for background
  background (bg);
  Letter = loadImage ("hogwarts letter.jpeg");
  Azkaban = loadImage ("azkaban.jpeg");
  //Castle = loadImage ("castle.jpeg");

  // always play the song. If it ends, it starts back up
  if (!backgroundSong.isPlaying ()) {
    backgroundSong.play ();
  }

  p1.move ();
  p1.updateBounds ();
  p1.display ();

  //animation
  image.display (p1.x, p1.y);

  mandrakeAnimation.isAnimating = true;


  //Score
  aScore.display ();

  for (Obstacles anObstacle : mandrakeList) {
    anObstacle.display ();
    p1.collision (anObstacle, aScore);//obstacle 
    mandrakeAnimation.display (int (anObstacle.x), int (anObstacle.y));
    mandrakeAnimation.isAnimating = true;
  }
  for (Enemy anEnemy : enemyList) {
    p1.beingHit (anEnemy);
    anEnemy.display ();
    anEnemy.move (p1);
    anEnemy.updateBounds ();
    dementorAnimation.display (int(anEnemy.x), int(anEnemy.y));
    dementorAnimation.isAnimating =true;

    for (Spell b1 : spellList) {
      anEnemy.isHit(b1);
    }
  }

  for (Spell b1 : spellList) {
    b1.render ();
    b1.move ();
    b1.updateBounds ();
    
  }

  for (Snitch aSnitch : snitchList) {
    aSnitch.display ();
    aSnitch.isHit (p1, aScore);
    aSnitch.move ();
    aSnitch.updateBounds ();
    snitchAnimation.display (aSnitch.x, aSnitch.y);
    snitchAnimation.isAnimating =true;
    
  }
    for (int i=snitchList.size()-1; i>=0; i--) {
      if (snitchList.get(i).hitSnitch == true) {
        snitchList.remove (i);
      }
    }


  for (int i=enemyList.size()-1; i>=0; i--) {
    if (enemyList.get(i).isDead == true) {
      enemyList.remove(i);
      aScore.incS ();
    }
  }
  
  for (int i=spellList.size()-1; i>=0; i--) {
    if (spellList.get(i).spellBurst == true) {
      spellList.remove(i);
    }
  }


  switch(switchVal) {
  case 1:  //Start Screen
    PFont font;
    font = loadFont ("Trattatello-48.vlw");
    textFont (font, 70);
    text ("Harry Potter and the Dark Chamber ", 75, 100);
    textFont (font, 30);
    text ("press to button to begin your journey", 90, 700);
    textFont (font, 40);
    text ("use 'w' to move up", 700, 500);
    textFont (font, 40);
    text ("use 's' to move down", 700, 550);
    textFont (font, 40);
    text ("use 'a' to move left", 700, 600);
    textFont (font, 40);
    text ("use 'd' to move right", 700, 650);
    textFont (font, 40);
    text ("press space to shoot", 700, 700);

    button1.render ();
    if (button1.isInButton () && mousePressed == true) {
      switchVal = 2;
      p1.resetPosition ();
      enemyList.add(new Enemy (500, 500, 195, 150));
      enemyList.add(new Enemy (700, 300, 195, 150));
    }

    break;


  case 2: //level ONE (dementors)
    mandrakeList.add(new Obstacles (600, 400, 100));

    if (enemyList.size() == 0) {
      d1.render ();
      d1.doorHit (p1);


      if ( d1.isDoorCollide == true) { 
        println ("working");
        switchVal = 3;
          enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
        enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
   
        snitchList.add(new Snitch (300, 200));
        aScore.level ();
        p1.resetPosition ();
      }
    }

    if (p1.isInAzkaban == true) {
      switchVal = 6;
      println ("azkaban");
    }
    break; 

  case 3: //Second level

    d2.render ();
    d2.doorHit (p1);
    mandrakeList.add(new Obstacles (600, 200, 100));
    mandrakeList.add(new Obstacles (600, 400, 100));
 

    if (d2.isDoorCollide == true) {    
      aScore.level ();
      switchVal = 4;
      p1.resetPosition ();
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      enemyList.add(new Enemy (random (300,900), random (200,700), 200, 200));
      mandrakeList.add(new Obstacles (random (200,900), random (200,700), 100));
      mandrakeList.add(new Obstacles (random (200,900), random (200,700), 100));
      mandrakeList.add(new Obstacles (random (200,900), random (200,700), 100));
      mandrakeList.add(new Obstacles (random (200,900), random (200,700), 100));
      mandrakeList.add(new Obstacles (random (200,900), random (200,700), 100));

    }
    if (p1.isInAzkaban == true) {
      switchVal = 6;
    }
    break;

  case 4:  //FINAL LEVEL
    d3.render ();
    d3.doorHit (p1);

    if (d3.isDoorCollide == true) {
      aScore.level ();
      switchVal = 5;
    }
    if (p1.isInAzkaban == true) {
      switchVal = 6;
    }
    break;

  case 5:  //Winning Screen  //display letter of saving Hogwarts
  backgroundSong.stop ();
    if (d2.isDoorCollide == true) { 
      image (Letter, width/2, height/2);
      font = loadFont ("Trattatello-48.vlw");
      textFont (font, 30);
      textAlign (CENTER);
      text ("Hooray! You have once again saved Hogwarts from Dark magic! ", width/2, 250);
      text ("Report to the Chamber of Reception", width/2, 300);
      text ("upon return to be honored for the greatest award.", width/2, 350);
      text (" We look forward to seeing you!", width/2, 400);
    }
    button1.render ();
    if (button1.isInButton () && mousePressed == true) {
      setup();
      switchVal = 1;
    }
    break;

  case 6: //losing Screen   SENT TO AZKABAN
  backgroundSong.stop ();
    image (Azkaban, width/2, height/2);
    font = loadFont ("Trattatello-48.vlw");
    textFont (font, 30);
    textAlign (CENTER);
    text ("You have been captured by a dementor and sent to Azkaban", 700, 100);
    textFont (font, 30);
    text ("press the button to escape and restart", 200, 700);
    button1.render ();
    if (button1.isInButton () && mousePressed == true) {
      setup();
      switchVal = 1;
      backgroundSong.stop ();
    }
    break;
  }
}

void keyPressed () { 

  if (key == ' ') {
    spellList.add(new Spell (p1.x +100, p1.y-85));
    if (bulletSound.isPlaying ()) {
      bulletSound.stop ();
    }
    bulletSound.play ();

    image.isAnimating = true;   //look inside harry animation constant loop
  }


  if (key == 'w') {
    p1.isJumping = true;
    println ("working");
  } else if (key == 'a') {
    p1.isMovingLeft = true;
  } else if (key == 's') {
    p1.isFalling = true;
  } else if (key == 'd') {
    p1.isMovingRight = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    p1.isJumping = false;
  } else if (key == 'a') {
    p1.isMovingLeft = false;
  } else if (key == 's') {
    p1.isFalling = false;
  } else if (key == 'd') {
    p1.isMovingRight = false;
  }
}
