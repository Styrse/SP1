PImage coffee;
PImage cat;
PImage[] botImages = new PImage[10];

SoundFile catSound;

boolean catSoundOn = false;

int character = 1;

void loadPlayer() {
  playerIcon();
  textSize(tileY*0.6);
  nameTag(playerName, playerXPosition, playerYPosition, 2.6);
}

//Sets player icon. Can later be used for multi options of a character
void playerIcon() {
  imageMode(CENTER);
  if (character == 0) {
    cat = loadImage("data/images/characters/cat.png");
    image(cat, playerXPosition, playerYPosition, tileX*4, tileY*4);

    if (catSoundOn == false) {
      catSound = new SoundFile(this, "sounds/cat.wav");
      catSound.play();
      catSoundOn = true;
    }
  } else if (character == 1) {
    coffee = loadImage("data/images/characters/coffee.png");
    image(coffee, playerXPosition, playerYPosition, tileX*4, tileY*4);
  }
}

void loadBots() {
  imageMode(CENTER);
  for (int i = 0; i < imageName.length; i++) {
    botImages[i] = loadImage("data/images/characters/" + imageName[i] + ".png");
    image(botImages[i], botXPosition[i], botYPosition[i], tileX*3, tileY*3);
    textSize(tileY*0.4);
    nameTag(bots[i].fullName, botXPosition[i], botYPosition[i], 1.8);
  }
}

void nameTag(String name, float xPos, float yPos, float h) {
  rectMode(CORNERS);
  strokeWeight(2);
  fill(0, 255, 0, 127);
  rect(xPos-tileX*2.25, yPos-tileY*(h*1.2), xPos+tileX*2.25, yPos-tileY*(h*0.8), 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text(name, xPos, yPos-tileY*h);
}

public void movementBots() {
  for (int i = 0; i < amountBots; i++) {
    botXPosition[i] += random(-tileX*0.25, tileX*0.25);
    botYPosition[i] += random(-tileY*0.25, tileY*0.25);
    botXPosition[i] = constrain(botXPosition[i], leftWalkableEdge, rightWalkableEdge);
    botYPosition[i] = constrain(botYPosition[i], topWalkableEdge, bottomWalkableEdge);
  }
}
