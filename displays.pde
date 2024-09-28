PImage img;
PImage wallet;
PImage tickets;
PImage coffee;
PImage bankIMG;
PImage raffle;
PImage help;
PImage lottery;
PImage arrows;
PImage mouse;

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

boolean moving = false;
boolean walletOn = false;
boolean motherload = false;
boolean playerTicketsOn = false;
boolean bankOn = false;
boolean raffleOn = false;
boolean helpOn = false;
boolean start = true;
boolean typing = false;
boolean gameEnded = false;

int winRate;

ArrayList<Integer> winningNumbers = new ArrayList<Integer>();
ArrayList<Integer> winningTicketsID = new ArrayList<Integer>();

void backgroundFunction() {
  imageMode(CENTER);
  img = loadImage("carnival_background.jpg");
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
  fill(255, 0, 255, 150);
  rect(width/2, height/4, width/2, height/4, 25);

  //Arrows
  imageMode(CENTER);
  arrows = loadImage("keyboard.png");
  image(arrows, tileX*12, tileY*9.5, tileX*2.5, tileY*2.5);
  //Mouse
  mouse = loadImage("mouse.png");
  image(mouse, tileX*18, tileY*9.5, tileX*2.5, tileY*2.5);

  fill(0);
  textAlign(CENTER);
  textSize(width/45);
  text("Use the arrow keys to move around \nUse the mouse for interactions", width/2, height/5);
}

void menu() {
  fill(255, 127, 0, 200);
  rectMode(CENTER);
  rect(width/2, tileY*2, width-tileX*2, tileY*2, 25);
  rectMode(CORNERS);
  //Sub menus
  rect(tileX, tileY, tileX*12, tileY*3, 25);
  rect(tileX*12, tileY, tileX*23, tileY*3, 25);
  rect(tileX*23, tileY, tileX*29, tileY*3, 25);

  //Wallet
  imageMode(CORNERS);
  wallet = loadImage("wallet.png");
  image(wallet, leftWallet, top, rightWallet, bottom);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);
  //Tickets
  tickets = loadImage("tickets.png");
  image(tickets, leftTickets, top, rightTickets, bottom);
  text(player.tickets, tileX*9.25, tileY*2);
  //Bank
  bankIMG = loadImage("bank.png");
  image(bankIMG, leftBank, top, rightBank, bottom);
  text(bank, tileX*15.25, tileY*2);
  //Raffle
  raffle = loadImage("raffle.png");
  image(raffle, leftRaffle, top, rightRaffle, bottom);
  //Help
  help = loadImage("help.png");
  image(help, leftHelp, top, rightHelp, bottom);
  //Lottery
  lottery = loadImage("lottery.png");
  image(lottery, leftLottery, top, rightLottery, bottom);
}

void makePlayer() {
  imageMode(CENTER);
  coffee = loadImage("coffee.png");
  image(coffee, playerXPosition, playerYPosition, tileX*4, tileY*4);
  //Name tag
  rectMode(CORNERS);
  strokeWeight(2);
  fill(0, 255, 0, 127);
  rect(playerXPosition-tileX*2, playerYPosition-tileY*3, playerXPosition+tileX*2, playerYPosition-tileY*2.2, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(tileY*0.4);
  text(playerName, playerXPosition, playerYPosition-tileY*2.6);
}

void keyPressed() {
  if (start == true && typing == true) {
    if (key == BACKSPACE && playerName.length() > 0 && playerName.length() < 20) {
      playerName = playerName.substring(0, playerName.length()-1);
    } else if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      playerName += key;
      if (playerName.length() > 15) {
        playerName = playerName.substring(0, 15);
      }
    } else if (key == ENTER && playerName.length() > 0) {
      start = false;
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
  if (start == false  && gameEnded == false) {
    if (playerXPosition >= leftAccesBoxTicketBooth && playerXPosition <= rightAccessBoxTicketBooth && playerYPosition <= bottomAccessBoxTicketBooth && playerYPosition >= topAccessBoxTicketBooth) {
      if (mouseX >= leftClickAreaTicketBooth && mouseX <= rightClickAreaTicketBooth && mouseY <= bottomClickAreaTicketBooth && mouseY >= topClickAreaTicketBooth) {
        player.ticket(1);
        println("Ticket bought - Make ticket pop on screen");
        printPlayerInfo();
      }
    } else if (playerXPosition >= leftAccessBoxTent && playerXPosition <= rightAccessBoxTent && playerYPosition <= bottomAccessBoxTent && playerYPosition >= topAccessBoxTent) {
      if ( mouseX >= leftClickAreaTent && mouseX <= rightClickAreaTent && mouseY <= bottomClickAreaTent && mouseY >= topClickAreaTent) {
        tent();
      }
    }
    if (mouseX < rightWallet && mouseX > leftWallet && mouseY < bottom && mouseY > top) {
      if (helpOn == true || playerTicketsOn == true || bankOn == true || raffleOn == true) {
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      walletOn = !walletOn;
    } else if (mouseX < rightTickets && mouseX > leftTickets && mouseY < bottom && mouseY > top) {
      if (helpOn == true || walletOn == true || bankOn == true || raffleOn == true) {
        walletOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      playerTicketsOn = !playerTicketsOn;
    } else if (mouseX < rightBank && mouseX > leftBank && mouseY < bottom && mouseY > top) {
      if (helpOn == true || walletOn == true || playerTicketsOn == true || raffleOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      println("Bank");
    } else if (mouseX < rightRaffle && mouseX > leftRaffle && mouseY < bottom && mouseY > top) {
      if (helpOn == true || walletOn == true || playerTicketsOn == true || bankOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      println("Raffle");
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
    }
  } else if (start == true) {
    if (start == true && mouseX < rightUsername && mouseX > leftUsername && mouseY < bottomUsername && mouseY > topUsername) {
      typing = true;
    } else if (mouseX < rightEnter && mouseX > leftEnter && mouseY < bottomEnter && mouseY > topEnter) {
      start = false;
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
  lottery = loadImage("lottery.png");
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
}

void lottery() {

  gameEnded = true;

  println("Lottery - More to do");
}

void displayEndScreen() {
  rectMode(CENTER);
  fill(255, 127, 0, 200);
  rect(width/2, height/2, width/2, height/2, 25);

  //All winning numbers
  fill(0);
  textSize(width/25);
  text("Winning numbers", width/2, tileY*9);
  line(tileX*8, tileY*10, tileX*22, tileY*10);
  textSize(width/45);
  int j = 0;
  for (int i = 0; i < winningTicketsID.size(); i++) {
    if (i % 5 == 0 && i != 0) {
      j++;
    }
    text(winningTicketsID.get(i), tileX*11+tileX*2*(i%5), tileY*10.5+tileY*j);
  }

  //Player winning numbers
  textSize(width/25);
  text("Your numbers", width/2, tileY*15);
  line(tileX*8, tileY*15.75, tileX*22, tileY*15.75);
  textSize(width/45);
  int k = 0;
  for (int i = 0; i < player.tickets; i++) {
    if (i % 5 == 0 && i != 0) {
      k++;
    }
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*16.75+tileY*k);
  }
}

void wallet() {
  smallBox("Your wallet");
  int gamble = 0;
  textAlign(CENTER);
  textSize(width/45);

  text("Tickets    =    " + (player.tickets == 0 ? "": "-") + player.tickets*ticketPrice, tileX*15, tileY*12.5);
  if (player.wallet+(player.tickets+ticketPrice) == player.initialWallet) {
    text("Gamble    =    " + player.wallet, tileX*15, tileY*13.5);
  } else if (player.wallet+(player.tickets*ticketPrice) < 100) {
    text("Gamble    =    -" + (player.initialWallet+(player.tickets*ticketPrice)), tileX*15, tileY*13.5);
  } else if (player.wallet+(player.tickets*ticketPrice) > 100) {
    text("Gamble    =    +" + (player.initialWallet-player.wallet+player.tickets*ticketPrice), tileX*15, tileY*13.5);
  }
  if (motherload == true) {
    text("Motherload    =    " + player.wallet, tileX*15, tileY*14.5);
    text("Balance    =    " + player.wallet, tileX*15, tileY*15.5);
  } else {
    text("Balance    =    " + player.wallet, tileX*15, tileY*14.5);
  }
}

void playerTickets() {
  smallBox("Your Tickets");

  textSize(width/45);
  int k = 0;
  for (int i = 0; i < player.tickets; i++) {
    if (i % 5 == 0 && i != 0) {
      k++;
    }
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*12.25+tileY*k);
  }
}

void smallBox(String text) {
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX*10, tileY*10, tileX*20, tileY*20, 25);
  fill(0);
  textSize(width/25);
  line(tileX*11, tileY*11.75, tileX*19, tileY*11.75);
  text(text, width/2, tileY*11);
}
