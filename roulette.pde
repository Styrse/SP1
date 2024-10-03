void roulette() {
  gambleTrue = true;
  loadRoulette(1.2);

  rouletteSound = new SoundFile(this, "sounds/roulette.wav");
  rouletteSound.play();

  //Generate a random int number
  int randomNumber = (int) random(0, 36+1);

  if (number == 1 || number == 2 || number == 3 || number == 4 || number == 5) {
    if (randomNumber == 0) {
      number = 0;
    } else if (number == 1) {
      if (randomNumber % 2 != 0) {
        number = 1;
      } else {
        number = 0;
      }
    } else if (number == 2) {
      if (randomNumber % 2 == 0) {
        number = 2;
      } else {
        number = 0;
      }
    } else if (number == 3) {
      if (checkValue(randomNumber)) {
        number = 3;
      } else {
        number = 0;
      }
    } else if (number == 4) {
      if (!checkValue(randomNumber)) {
        number = 4;
      } else {
        number = 0;
      }
    } else if (number == 5) {
      if (randomNumber == playerPickInt) {
        number = 5;
      } else {
        number = 0;
      }
      playerPick = "";
    }
  }
  imageMode(CENTER);
  win = loadImage("data/images/icons/win.png");
  loss = loadImage("data/images/icons/loss.png");

  winSound = new SoundFile(this, "sounds/win.wav");
  switch (number) {
  case 0:
    image(loss, centerX, centerY, iconSizeX*2, iconSizeY*2);
    break;
  case 1:
  case 2:
  case 3:
  case 4:
    player.wallet += bet+bet;
    player.gamble += bet+bet;
    winSound.play();
    image(win, centerX, centerY, iconSizeX*2, iconSizeY*2);
    break;
  case 5:
    player.wallet += bet*35+bet;
    player.gamble += bet*35+bet;
    winSound.play();
    image(win, centerX, centerY, iconSizeX*2, iconSizeY*2);
    break;
  }

  //Resets number and betOn
  number = 0;
  betOn = false;
}

boolean checkValue(int checkNumber) {
  for (int i = 0; i < redNumbers.length; i++) {
    if (redNumbers[i] == checkNumber) {
      return true;
    }
  }
  return false;
}

void loadRoulette(float size) {
  imageMode(CENTER);
  roulette = loadImage("data/images/icons/roulette.png");
  image(roulette, tileX*15, tileY*22, (tileX*6)*size, (tileY*6)*size);
}
