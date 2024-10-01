import java.util.Collections;

PImage img;
PImage tentBackground;
PImage roulette;
PImage wallet;
PImage tickets;
PImage coffee;
PImage bankIMG;
PImage raffle;
PImage help;
PImage lottery;
PImage arrows;
PImage mouse;
PImage cross;
PImage exit;
PImage carnivalTent;
PImage arrowUp;
PImage arrowDown;
PImage[] botImages = new PImage[10];
String[] imageName = {"avocado", "bread", "burger", "can", "cookie", "doughnut", "frenchfries", "pineapple", "pizza", "tomato"};
int[] redNumbers = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};

float iconSizeX;
float iconSizeY;

float playerXPosition;
float playerYPosition;

float leftWalkableEdge;
float rightWalkableEdge;
float topWalkableEdge;
float bottomWalkableEdge;

//Access area ticket booth
float leftAccesBoxTicketBooth;
float rightAccessBoxTicketBooth;
float topAccessBoxTicketBooth;
float bottomAccessBoxTicketBooth;

//Enter ticket booth area
float leftClickAreaTicketBooth;
float rightClickAreaTicketBooth;
float topClickAreaTicketBooth;
float bottomClickAreaTicketBooth;

//Access area tent
float leftAccessBoxTent;
float rightAccessBoxTent;
float topAccessBoxTent;
float bottomAccessBoxTent;

//Enter tent area
float leftClickAreaTent;
float rightClickAreaTent;
float topClickAreaTent;
float bottomClickAreaTent;

//Menu
float top;
float bottom;
//Wallet
float leftWallet;
float rightWallet;
//Tickets
float leftTickets;
float rightTickets;
//Bank
float leftBank;
float rightBank;
//Raffle
float leftRaffle;
float rightRaffle;
//Help
float leftHelp;
float rightHelp;
//Lottery
float leftLottery;
float rightLottery;

//Username box
float leftUsername;
float rightUsername;
float topUsername;
float bottomUsername;

//Enter box
float leftEnter;
float rightEnter;
float topEnter;
float bottomEnter;

//Motherload
float leftMotherload;
float rightMotherload;
float topMotherload;
float bottomMotherload;

//Cross
float leftCross;
float rightCross;
float topCross;
float bottomCross;

//Exit
float leftExit;
float rightExit;
float topExit;
float bottomExit;

//Restart
float leftRestart;
float rightRestart;
float topRestart;
float bottomRestart;

//Roulette
float leftRoulette;
float rightRoulette;
float topRoulette;
float bottomRoulette;

//Bet
float  bet = 5;

//Betting arrows
float leftDownArrow;
float rightDownArrow;
float topDownArrow;
float bottomDownArrow;

float leftUpArrow;
float rightUpArrow;
float topUpArrow;
float bottomUpArrow;

//Odd/Even
float leftOdd;
float rightOdd;
float topOdd;
float bottomOdd;

float leftEven;
float rightEven;
float topEven;
float bottomEven;

//Red/Green
float leftRed;
float rightRed;
float topRed;
float bottomRed;

float leftGreen;
float rightGreen;
float topGreen;
float bottomGreen;

//Poker chip
float leftPokerChip;
float rightPokerChip;
float topPokerChip;
float bottomPokerChip;

boolean moving = false;
boolean walletOn = false;
boolean motherload = false;
boolean motherloadTrue = false;
boolean playerTicketsOn = false;
boolean bankOn = false;
boolean raffleOn = false;
boolean helpOn = false;
boolean tentOn = false;
boolean start = true;
boolean typing = false;
boolean gameEnded = false;
boolean betOn = false;

String codeEntered = "";
String motherloadString = "Motherload";
String playerPick = "";

int winRate;
int motherloadCount = 0;
int motherloadMoney = 1000;
int bank = 0;
int number = 0;
int playerPickInt;

ArrayList<Integer> winningNumbers = new ArrayList<Integer>();
ArrayList<Integer> winningTicketsID = new ArrayList<Integer>();

void backgroundFunction() {
  imageMode(CENTER);
  img = loadImage("images/carnival_background.jpg");
}

void boxes() {
  tileX = width/30;
  tileY = height/30;

  rectMode(CORNERS);
  strokeWeight(3);
  noFill();
  //Ticket booth
  rect(leftAccesBoxTicketBooth, topAccessBoxTicketBooth, rightAccessBoxTicketBooth, bottomAccessBoxTicketBooth, 15);
  rect(leftClickAreaTicketBooth, topClickAreaTicketBooth, rightClickAreaTicketBooth, bottomClickAreaTicketBooth, 15);
  //Tent
  rect(leftAccessBoxTent, topAccessBoxTent, rightAccessBoxTent, bottomAccessBoxTent, 15);
  rect(leftClickAreaTent, topClickAreaTent, rightClickAreaTent, bottomClickAreaTent, 100, 100, 15, 15);
  //Walkable area
  rect(leftWalkableEdge, topWalkableEdge, rightWalkableEdge, bottomWalkableEdge, 15);
  //Motherload
  rect(leftMotherload, topMotherload, rightMotherload, bottomMotherload, 15);

  //Menu
  //Wallet
  rect(leftWallet, top, rightWallet, bottom, 5);
  //Tickets
  rect(leftTickets, top, rightTickets, bottom, 5);
  //Bank
  rect(leftBank, top, rightBank, bottom, 5);
  //Raffle
  rect(leftRaffle, top, rightRaffle, bottom, 5);
  //Help
  rect(leftHelp, top, rightHelp, bottom, 5);
  //Lottery
  rect(leftLottery, top, rightLottery, bottom, 5);

  //Info box
  rectMode(CENTER);
  fill(255, 127, 0, 200);
  rect(width/2, height/4, width/2, height/4, 25);

  //Arrows
  imageMode(CENTER);
  arrows = loadImage("images/icons/keyboard.png");
  image(arrows, tileX*12, tileY*9.5, tileX*2.5, tileY*2.5);
  //Mouse
  mouse = loadImage("images/icons/mouse.png");
  image(mouse, tileX*18, tileY*9.5, tileX*2.5, tileY*2.5);

  fill(0);
  textAlign(CENTER);
  textSize(width/45);
  text("Use the arrow keys to move around \nUse the mouse for interactions", width/2, height/5);
}

void menu() {
  fill(255, 127, 0, 200);
  rectMode(CENTER);
  //rect(width/2, tileY*2, width-tileX*2, tileY*2, 25);
  rectMode(CORNERS);
  //Sub menus
  rect(tileX, tileY, tileX*12, tileY*3, 25);
  rect(tileX*12, tileY, tileX*23, tileY*3, 25);
  rect(tileX*23, tileY, tileX*29, tileY*3, 25);

  //Wallet
  imageMode(CORNERS);
  wallet = loadImage("images/icons/wallet.png");
  image(wallet, leftWallet, top, rightWallet, bottom);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);
  //Tickets
  tickets = loadImage("images/icons/tickets.png");
  image(tickets, leftTickets, top, rightTickets, bottom);
  text(player.tickets, tileX*9.25, tileY*2);
  //Bank
  bankIMG = loadImage("images/icons/bank.png");
  image(bankIMG, leftBank, top, rightBank, bottom);
  text(bank, tileX*15.25, tileY*2);
  //Raffle
  raffle = loadImage("images/icons/raffle.png");
  image(raffle, leftRaffle, top, rightRaffle, bottom);
  //Help
  help = loadImage("images/icons/help.png");
  image(help, leftHelp, top, rightHelp, bottom);
  //Lottery
  lottery = loadImage("images/icons/lottery.png");
  image(lottery, leftLottery, top, rightLottery, bottom);
}

void loadPlayer() {
  imageMode(CENTER);
  coffee = loadImage("images/characters/coffee.png");
  image(coffee, playerXPosition, playerYPosition, tileX*4, tileY*4);
  textSize(tileY*0.6);
  nameTag(playerName, playerXPosition, playerYPosition, 2.6);
}

void loadBots() {
  imageMode(CENTER);

  for (int i = 0; i < imageName.length; i++) {
    botImages[i] = loadImage("images/characters/" + imageName[i] + ".png");
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

void keyPressed() {
  if (start == true && typing == true) {
    if (key == BACKSPACE && playerName.length() > 0 && playerName.length() < 15) {
      playerName = playerName.substring(0, playerName.length()-1);
    } else if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      playerName += key;
      if (playerName.length() > 15) {
        playerName = playerName.substring(0, 15);
      }
    } else if (key == ENTER && playerName.length() > 0) {
      start = false;
    }
  } else if (tentOn == true && typing == true){
    if (key == BACKSPACE && playerPick.length() > 0){
      playerPick = playerPick.substring(0, playerPick.length()-1);
    } else if (Character.isDigit(key)) {
      playerPick += key;
    }
    playerPickInt = constrain(Integer.parseInt(playerPick), 0, 37);
  }

  if (motherload == true) {
    if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      codeEntered += key;
    } else if (key ==ENTER) {
      if (codeEntered.equals(motherloadString)) {
        player.wallet += motherloadMoney;
        motherloadTrue = true;
        motherloadCount++;
      }
      codeEntered = "";
      motherload = false;
    }
  }


  if (start == false) {
    if (key == CODED) {
      if (keyCode == LEFT && !moving) {
        playerXPosition-= tileX*0.5;
      } else if (keyCode == RIGHT && !moving) {
        playerXPosition+= tileX*0.5;
      } else if (keyCode == UP && !moving) {
        playerYPosition-= tileY*0.5;
      } else if (keyCode == DOWN && !moving) {
        playerYPosition+= tileY*0.5;
      }
    }
  }

  playerXPosition = constrain(playerXPosition, leftWalkableEdge, rightWalkableEdge);
  playerYPosition = constrain(playerYPosition, topWalkableEdge, bottomWalkableEdge);
}

void keyReleased() {
  moving = false;
}

void mouseClicked() {
  if (start == false  && gameEnded == false && tentOn == false) {
    if (playerXPosition >= leftAccesBoxTicketBooth && playerXPosition <= rightAccessBoxTicketBooth && playerYPosition <= bottomAccessBoxTicketBooth && playerYPosition >= topAccessBoxTicketBooth) {
      if (mouseX >= leftClickAreaTicketBooth && mouseX <= rightClickAreaTicketBooth && mouseY <= bottomClickAreaTicketBooth && mouseY >= topClickAreaTicketBooth) {
        if (player.wallet > 0) {
          image(tickets, tileX*6, tileY*19, tileX*2, tileY*2);
        }
        player.ticket(1);
      }
    } else if (playerXPosition >= leftAccessBoxTent && playerXPosition <= rightAccessBoxTent && playerYPosition <= bottomAccessBoxTent && playerYPosition >= topAccessBoxTent) {
      if ( mouseX >= leftClickAreaTent && mouseX <= rightClickAreaTent && mouseY <= bottomClickAreaTent && mouseY >= topClickAreaTent) {
        if (walletOn == true || playerTicketsOn == true || bankOn == true || raffleOn == true || helpOn == true) {
          walletOn = false;
          playerTicketsOn = false;
          bankOn = false;
          raffleOn = false;
          helpOn = false;
        }
        tentOn = !tentOn;
      }
    }
    if (mouseX < rightWallet && mouseX > leftWallet && mouseY < bottom && mouseY > top) {
      if (playerTicketsOn == true || bankOn == true || raffleOn == true || helpOn == true) {
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      walletOn = !walletOn;
    } else if (mouseX < rightTickets && mouseX > leftTickets && mouseY < bottom && mouseY > top) {
      if (walletOn == true || bankOn == true || raffleOn == true || helpOn == true) {
        walletOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      playerTicketsOn = !playerTicketsOn;
    } else if (mouseX < rightBank && mouseX > leftBank && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || raffleOn == true || helpOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      bankOn = !bankOn;
    } else if (mouseX < rightRaffle && mouseX > leftRaffle && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || bankOn == true || helpOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      raffleOn = !raffleOn;
    } else if (mouseX < rightHelp && mouseX > leftHelp && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || bankOn == true || raffleOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
      }
      helpOn = !helpOn;
    } else if (mouseX < rightLottery && mouseX > leftLottery && mouseY < bottom && mouseY > top) {
      if (helpOn == true) {
        helpOn = false;
      }
      lottery();
    } else if (mouseX < rightMotherload && mouseX > leftMotherload && mouseY < bottomMotherload && mouseY > topMotherload) {
      motherload = true;
    }
    if (mouseX < rightCross && mouseX > leftCross && mouseY < bottomCross && mouseY > topCross) {
      walletOn = false;
      playerTicketsOn = false;
      bankOn = false;
      raffleOn = false;
    }
  } else if (start == true) {
    if (start == true && mouseX < rightUsername && mouseX > leftUsername && mouseY < bottomUsername && mouseY > topUsername) {
      typing = true;
    } else if (mouseX < rightEnter && mouseX > leftEnter && mouseY < bottomEnter && mouseY > topEnter && playerName.length() > 0) {
      start = false;
    }
  } else if (tentOn == true) {
    if (mouseX < rightExit && mouseX > leftExit && mouseY < bottomExit && mouseY > topExit) {
      playerXPosition = tileX*23;
      playerYPosition = tileY*23.5;
      tentOn = false;
    }
    if (mouseX < rightDownArrow && mouseX > leftDownArrow && mouseY < bottomDownArrow && mouseY > topDownArrow) {
      bet -= 5;
    } else if (mouseX < rightUpArrow && mouseX > leftUpArrow && mouseY < bottomUpArrow && mouseY > topUpArrow) {
      bet += 5;
    }
    bet = constrain(bet, 0, player.wallet);

    if (mouseX < rightOdd && mouseX > leftOdd && mouseY < bottomOdd && mouseY > topOdd) {
      number = 1;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightEven && mouseX > leftEven && mouseY < bottomEven && mouseY > topEven) {
      number = 2;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightRed && mouseX > leftRed && mouseY < bottomRed && mouseY > topRed) {
      number = 3;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightGreen && mouseX > leftGreen && mouseY < bottomGreen && mouseY > topGreen) {
      number = 4;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightPokerChip && mouseX > leftPokerChip && mouseY < bottomPokerChip && mouseY > topPokerChip) {
      number = 5;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightRoulette && mouseX > leftRoulette && mouseY < bottomRoulette && mouseY > topRoulette && betOn == true) {
      player.wallet -= bet;
      roulette();
    }
  }
}


void startInfo() {
  rectMode(CENTER);
  fill(255, 127, 0, 200);
  rect(width/2, height/2, width/2, height/2, 25);
  line(tileX*8, tileY*11, tileX*22, tileY*11);
  line(tileX*8, tileY*17, tileX*22, tileY*17);

  textAlign(CENTER, CENTER);
  textSize(width/45);
  fill(0);
  text("Enjoy a sunny day at the " + '"' + "Fantasia Fairgrounds" + '"' + "\nBuy some lottery tickets or gamble in the tent", width/2, tileY*9.5);
  strokeWeight(1.5);

  text("To finish the day and see what you won \nclick this icon in the top right corner.", width/2, tileY*12.5);
  imageMode(CENTER);
  lottery = loadImage("images/icons/lottery.png");
  image(lottery, width/2, height/2, iconSizeX*2, iconSizeY*2);

  //Username
  text("Please enter your name by clicking the box below.", width/2, tileY*17.75);
  textSize(width/65);
  text("Max 15 chracters", width/2, tileY*18.5);
  fill(255);
  rectMode(CORNERS);
  rect(leftUsername, topUsername, rightUsername, bottomUsername, 25);
  fill(0);
  textSize(tileX*1.15);
  text(playerName, width/2, tileY*19.75);

  if (playerName.length() <= 0) {
    fill(127);
  } else {
    fill(0, 255, 0);
  }
  rect(leftEnter, topEnter, rightEnter, bottomEnter, 25);
  textSize(width/35);
  fill(0);
  text("Enter", width/2, tileY*21.5);
}

void getWinningNumbers() {
  //Winning chance 20%
  winRate = (totalTickets/100)*20;

  for (int i = 0; i < winRate; i++) {
    winningNumbers.add((int) random(1, 100));
  }

  for (int i = 0; i < winRate; i++) {
    winningTicketsID.add(ticketsID.get(winningNumbers.get(i)));
  }
  Collections.sort(winningTicketsID);
}

void lottery() {

  gameEnded = true;

  println("Lottery - More to do");
}

void displayEndScreen() {
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
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*13.5+tileY*k);
  }
  imageMode(CORNERS);
  carnivalTent = loadImage("images/icons/carnival-tent.png");
  image(carnivalTent, leftRestart, topRestart, rightRestart, bottomRestart);
}


void wallet() {
  if (motherloadTrue == true) {
    box("Your wallet", 11, 10);
  } else {
    box("Your wallet", 10, 10);
  }
  int gamble = 0;
  textAlign(CENTER);
  textSize(width/45);

  text("Tickets    =    " + (player.tickets == 0 ? "": "-") + player.tickets*ticketPrice, tileX*15, tileY*7.5);
  if (player.gamble == 0) {
    text("Gamble    =    " + player.gamble, tileX*15, tileY*8.5);
  } else if (player.gamble < 0) {
    text("Gamble    =    -" + player.gamble, tileX*15, tileY*8.5);
  } else if (player.gamble > 0) {
    text("Gamble    =    +" + player.gamble, tileX*15, tileY*8.5);
  }
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
  cross = loadImage("images/icons/cross.png");
  image(cross, leftCross, topCross, rightCross, bottomCross);
}

void tent() {
  imageMode(CENTER);
  tentBackground = loadImage("images/tent_background.png");
  image(tentBackground, width/2, height/2, width, height);

  imageMode(CORNERS);
  exit = loadImage("images/icons/exit.png");
  image(exit, tileX*3, tileY*18, tileX*5, tileY*20);

  loadRoulette(1);

  //Wallet
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX, tileY, tileX*7, tileY*3, 25);
  imageMode(CORNERS);
  wallet = loadImage("images/icons/wallet.png");
  image(wallet, leftWallet, top, rightWallet, bottom);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);

  fill(255, 127, 0, 200);
  rect(tileX*3, tileY*4, tileX*27, tileY*13, 25);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width/30);
  text("Welcome to Casino Fantasia", width/2, tileY*5);
  line(tileX*4, tileY*5.75, tileX*26, tileY*5.75);

  text("Your bet", tileX*7.5, tileY*6.5);

  textSize(width/12);
  text((int)bet, tileX*7.5, tileY*8.5); //Typecasting just for Jesper


  arrowDown = loadImage("images/icons/down-arrow.png");
  arrowUp = loadImage("images/icons/up-arrow.png");
  imageMode(CORNERS);

  image(arrowDown, leftDownArrow, topDownArrow, rightDownArrow, bottomDownArrow);
  image(arrowUp, leftUpArrow, topUpArrow, rightUpArrow, bottomUpArrow);

  line(tileX*10.375, tileY*6.5, tileX*10.375, tileY*12);

  textSize(width/45);
  text("Pick a bet", tileX*19.5, tileY*6.5);



  fill(0);
  text("Odd or Even", tileX*13.125, tileY*8);
  text("Payout 1:1", tileX*13.125, tileY*11.75);
  text("Red or Green", tileX*18.625, tileY*8);
  text("Payout 1:1", tileX*18.625, tileY*11.75);
  text("Pick a number", tileX*24.125, tileY*8);
  text("Payout 35:1", tileX*24.125, tileY*11.75);
  
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
  ellipse(leftPokerChip, topPokerChip, rightPokerChip, bottomPokerChip);
  
  fill(0);
  textSize(width/20);
  text("1", leftOdd+tileX, topOdd+tileY);
  text("2", leftEven+tileX, topEven+tileY);
  text(playerPick, leftPokerChip+tileX, topPokerChip+tileY);
}

void loadRoulette(float size) {
  imageMode(CENTER);
  roulette = loadImage("images/roulette.png");
  image(roulette, tileX*15, tileY*22, (tileX*6)*size, (tileY*6)*size);
}

void roulette() {
  loadRoulette(1.2);

  println("Roulette");

  //Generate a random int number
  int randomNumber = (int) random(0, 36+1);

  if (number == 1 || number == 2 || number == 3 || number == 4) {
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
    }
  }





  println(number);
  println("Random number: " + randomNumber);

  switch (number) {
  case 1:
  case 2:
  case 3:
  case 4:
    println("1:1");
    println("Win");
    player.wallet += bet+bet;
    break;
  case 5:
    println("35:1");
    println("Win");
    player.wallet += bet*35+bet;
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
