PImage wallet;
PImage tickets;
PImage bankIMG;
PImage raffle;
PImage help;
PImage lottery;
PImage cross;

int motherloadCount = 0;
int motherloadMoney = 1000;
int bank = 0;

boolean flagTrue = false;
boolean skyTrue = false;
boolean popcornTrue = false;
boolean gambleTrue = false;
boolean ofelia = false;

void menu() {
  fill(255, 127, 0, 200);
  rectMode(CENTER);
  rectMode(CORNERS);
  //Sub menus
  rect(tileX, tileY, tileX*12, tileY*3, 25);
  rect(tileX*12, tileY, tileX*23, tileY*3, 25);
  rect(tileX*23, tileY, tileX*29, tileY*3, 25);

  //Wallet
  imageMode(CORNERS);
  wallet = loadImage("data/images/icons/wallet.png");
  image(wallet, leftWallet, top, rightWallet, bottom);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);
  //Tickets
  tickets = loadImage("data/images/icons/tickets.png");
  image(tickets, leftTickets, top, rightTickets, bottom);
  text(player.tickets, tileX*9.25, tileY*2);
  //Bank
  bankIMG = loadImage("data/images/icons/bank.png");
  image(bankIMG, leftBank, top, rightBank, bottom);
  text(bank, tileX*15.25, tileY*2);
  //Raffle
  raffle = loadImage("data/images/icons/raffle.png");
  image(raffle, leftRaffle, top, rightRaffle, bottom);
  //Help
  help = loadImage("data/images/icons/help.png");
  image(help, leftHelp, top, rightHelp, bottom);
  //Lottery
  lottery = loadImage("data/images/icons/lottery.png");
  image(lottery, leftLottery, top, rightLottery, bottom);

  if (motherloadTrue == true && popcornTrue == true && flagTrue == true && skyTrue == true && gambleTrue == true) {
    typing = true;
    ofelia = true;
  }
}

void wallet() {
  if (motherloadTrue == true) {
    box("Your wallet", 11, 10);
  } else {
    box("Your wallet", 10, 10);
  }
  textAlign(CENTER);
  textSize(width/45);

  text("Tickets    =    " + (player.tickets == 0 ? "": "-") + player.tickets*ticketPrice, tileX*15, tileY*7.5);
  text("Gamble    =    " + player.gamble, tileX*15, tileY*8.5);
  if (motherloadTrue == true) {
    text("Motherload    =    " + motherloadCount*motherloadMoney, tileX*15, tileY*9.5);
    text("Balance    =    " + player.wallet, tileX*15, tileY*10.5);
  } else {
    text("Balance    =    " + player.wallet, tileX*15, tileY*9.5);
  }
}

void playerTickets() {
  box("Your tickets", 15, 10);

  textSize(width/45);
  int k = 0;
  for (int i = 0; i < player.tickets; i++) {
    if (i % 5 == 0 && i != 0) {
      k++;
    }
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*7.25+tileY*k);
  }
}

void bank() {
  box("Bank", 10, 10);

  textAlign(CENTER);
  textSize(width/45);

  text("Income from tickets    =    " + (totalTickets-remainingTickets)*ticketPrice, tileX*15, tileY*7.5);
  text("Expenses from tickets    =    " + (totalTickets-remainingTickets)*ticketCostPrice, tileX*15, tileY*8.5);
  text("Profit from tickets    =    " + (totalTickets-remainingTickets)*(ticketPrice-ticketCostPrice), tileX*15, tileY*9.5);
}

void raffle() {
  box("Sold tickets", 20, 20);

  textAlign(CENTER);
  textSize(width/45);

  int k = 0;
  for (int i = 0; i < amountBots; i++) {
    if (i%2 == 0 && i != 0) {
      k++;
    }
    textSize(width/55);
    text(bots[i].fullName, tileX*10+tileX*10*(i%2), tileY*7.5+tileY*k*2.5);

    int v = 0;
    for (int j = 0; j < bots[i].tickets; j++) {
      if (j%3 == 0 && j != 0) {
        v++;
      }
      text(bots[i].boughtTickets[j], tileX*8.5+tileX*1.5*(j % 3)+tileX*10*(i % 2), tileY*8+tileY*v*.5+tileY*k*2.5);
    }
  }
}

void box(String text, int heightBox, int widthBox) {
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect((width/2)-tileX*(widthBox/2), tileY*5, width/2+tileX*(widthBox/2), tileY*heightBox, 25);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width/26);
  float space = tileX*(tiles-widthBox)/2+tileX;
  line(space, tileY*6.75, width-space, tileY*6.75);
  text(text, width/2, tileY*6);

  imageMode(CORNERS);
  cross = loadImage("data/images/icons/cross.png");
  image(cross, leftCross, topCross, rightCross, bottomCross);
}
