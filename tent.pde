PImage tentBackground;
PImage exit;
PImage arrowUp;
PImage arrowDown;

void tent() {
  imageMode(CENTER);
  tentBackground = loadImage("data/images/backgrounds/tent_background.png");
  image(tentBackground, width/2, height/2, width, height);

  imageMode(CORNERS);
  exit = loadImage("data/images/icons/exit.png");
  image(exit, tileX*3, tileY*18, tileX*5, tileY*20);

  //Crates a click effect
  loadRoulette(1);

  //Wallet
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX, tileY, tileX*7, tileY*3, 25);
  imageMode(CORNERS);
  wallet = loadImage("data/images/icons/wallet.png");
  image(wallet, leftWallet, top, rightWallet, bottom);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);

  fill(255, 127, 0, 200);
  rect(tileX*3, tileY*4, tileX*27, tileY*13, 25);

  //Help
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX*23, tileY, tileX*27, tileY*3, 25);
  imageMode(CORNERS);
  help = loadImage("data/images/icons/help.png");
  image(help, leftHelp, top, rightHelp, bottom);

  //Gambling
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width/30);
  text("Welcome to Casino Fantasia", width/2, tileY*5);
  line(tileX*4, tileY*5.75, tileX*26, tileY*5.75);

  text("Your bet", tileX*6.875, tileY*6.5);

  textSize(width/12);
  text((int)bet, tileX*6.875, tileY*8.5); //Typecasting just for Jesper

  arrowDown = loadImage("data/images/icons/down-arrow.png");
  arrowUp = loadImage("data/images/icons/up-arrow.png");
  imageMode(CORNERS);

  image(arrowDown, leftDownArrow, topDownArrow, rightDownArrow, bottomDownArrow);
  image(arrowUp, leftUpArrow, topUpArrow, rightUpArrow, bottomUpArrow);

  line(tileX*10.375, tileY*6.5, tileX*10.375, tileY*12);

  textSize(width/45);
  text("Pick a bet", tileX*18.625, tileY*6.5);

  fill(0);
  text("Odd or Even", tileX*13.125, tileY*8);
  text("Payout 1:1", tileX*13.125, tileY*11.75);
  text("Red or Green", tileX*18.625, tileY*8);
  text("Payout 1:1", tileX*18.625, tileY*11.75);
  text("Pick a number", tileX*24.125, tileY*8);
  text("Payout 35:1", tileX*24.125, tileY*11.75);
  textSize(width/65);
  text("From 0 to 36", tileX*24.125, tileY*8.5);

  ellipseMode(CORNERS);
  //Odd or even
  fill(255, 221, 74);
  ellipse(leftOdd, topOdd, rightOdd, bottomOdd);
  fill(156, 137, 184);
  ellipse(leftEven, topEven, rightEven, bottomEven);
  //Red or green
  fill(230, 57, 70);
  ellipse(leftRed, topRed, rightRed, bottomRed);
  fill(42, 157, 143);
  ellipse(leftGreen, topGreen, rightGreen, bottomGreen);
  //Pick a number
  fill(78, 168, 222);
  ellipse(leftPickANumber, topPickANumber, rightPickANumber, bottomPickANumber);

  fill(0);
  textSize(width/25);
  text("1", leftOdd+tileX, topOdd+tileY);
  text("2", leftEven+tileX, topEven+tileY);
  text(playerPick, leftPickANumber+tileX, topPickANumber+tileY);

  if (boxesTent == true) {
    boxesTent();
  }
}
