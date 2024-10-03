void draw() {
  image(img, width/2, height/2, width, height);

  menu();
  loadBots();
  if (helpOn == true) {
    boxes();
  } else if (start == true) {
    startInfo();
  } else if (gameEnded == true) {
    displayEndScreen();
  } else if (walletOn == true) {
    wallet();
  } else if (playerTicketsOn == true) {
    playerTickets();
  } else if (bankOn == true) {
    bank();
  } else if (raffleOn == true) {
    raffle();
  } else if (tentOn == true) {
    tent();
  }

  if (popcornOn == true) {
    passedTime = millis() - savedTime;
    popcorn();
  }

  loadPlayer();
  bots[1].movement();
}
