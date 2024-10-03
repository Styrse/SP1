PImage popcorn;

SoundFile popcornSound;

int savedTime;
int passedTime;

boolean popcornOn = false;

void popcorn() {
  popcorn = loadImage("data/images/icons/popcorn.png");

  //Speed of popcorn vertical movement
  float speed = passedTime/75;

  //Makes 300 popcorn buckets randomly across the screen
  for (int i = 0; i < 300; i ++) {
    walletOn = false;
    playerTicketsOn = false;
    bankOn = false;
    raffleOn = false;
    helpOn = false;
    image(popcorn, random(width), (random(-1000, 0))+(tileY*speed), random(0.8, 2)*iconSizeX, random(0.8, 2)*iconSizeY);
  }
  popcornSound = new SoundFile(this, "sounds/popcorn.wav");
  popcornSound.play();
  //Turn off popcorn rain
  if (passedTime > 5000) {
    popcornSound.stop();
    popcornOn = false;
    clickPossible = true;
  }
}
