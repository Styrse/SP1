PImage endGame;

SoundFile endSound;

boolean endSoundOn = false;

void displayEndScreen() {

  if (endSoundOn == false) {
    endSound = new SoundFile(this, "sounds/end.wav");
    endSound.play();
    endSoundOn = true;
  }

  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX*7, tileY*5, tileX*23, tileY*25.5, 25);

  //All winning numbers
  fill(0);
  textSize(width/25);
  textAlign(CENTER, CENTER);
  text("Winning numbers", width/2, tileY*6);
  line(tileX*8, tileY*6.75, tileX*22, tileY*6.75);
  textSize(width/45);
  int j = 0;
  for (int i = 0; i < winningTicketsID.size(); i++) {
    if (i % 5 == 0 && i != 0) {
      j++;
    }
    text(winningTicketsID.get(i), tileX*11+tileX*2*(i%5), tileY*7.5+tileY*j);
  }

  //Player winning numbers
  textSize(width/25);
  text("Your numbers", width/2, tileY*12);
  line(tileX*8, tileY*12.75, tileX*22, tileY*12.75);
  textSize(width/45);
  int k = 0;
  for (int i = 0; i < player.tickets; i++) {
    if (i % 5 == 0 && i != 0) {
      k++;
    }

    boolean isWinningNumber = false;
    for (int h = 0; h < winRate; h++) {
      if (player.boughtTickets[i] == winningTicketsID.get(h)) {
        isWinningNumber = true;
      }
    }
    if (isWinningNumber == true) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*13.5+tileY*k);
  }
  imageMode(CORNERS);
  endGame = loadImage("data/images/icons/endGame.png");
  image(endGame, leftEndGame, topEndGame, rightEndGame, bottomEndGame);
}
