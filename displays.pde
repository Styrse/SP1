import java.util.Collections;

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
PImage[] botImages = new PImage[10];
String[] imageName = {"avocado", "bread", "burger", "can", "cookie", "doughnut", "frenchfries", "pineapple", "pizza", "tomato"};

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

boolean moving = false;
boolean walletOn = false;
boolean motherload = false;
boolean motherloadTrue = false;
boolean playerTicketsOn = false;
boolean bankOn = false;
boolean raffleOn = false;
boolean helpOn = false;
boolean start = true;
boolean typing = false;
boolean gameEnded = false;

String codeEntered = "";
String motherloadString = "Motherload";

int winRate;
int motherloadCount = 0;
int motherloadMoney = 1000;

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
  nameTag(playerName, playerXPosition, playerYPosition);
}

void loadBots() {
  imageMode(CENTER);

  for (int i = 0; i < imageName.length; i++) {
    botImages[i] = loadImage("images/characters/" + imageName[i] + ".png");
    image(botImages[i], botXPosition[i], botYPosition[i], tileX*4, tileY*4);
    nameTag(bots[i].fullName, botXPosition[i], botYPosition[i]);
  }
}

void nameTag(String name, float xPos, float yPos) {
  rectMode(CORNERS);
  strokeWeight(2);
  fill(0, 255, 0, 127);
  rect(xPos-tileX*2.25, yPos-tileY*3, xPos+tileX*2.25, yPos-tileY*2.2, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(tileY*0.4);
  text(name, xPos, yPos-tileY*2.6);
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
      bankOn = !bankOn;
    } else if (mouseX < rightRaffle && mouseX > leftRaffle && mouseY < bottom && mouseY > top) {
      if (helpOn == true || walletOn == true || playerTicketsOn == true || bankOn == true) {
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
  } else if (start == true) {
    if (start == true && mouseX < rightUsername && mouseX > leftUsername && mouseY < bottomUsername && mouseY > topUsername) {
      typing = true;
    } else if (mouseX < rightEnter && mouseX > leftEnter && mouseY < bottomEnter && mouseY > topEnter && playerName.length() > 0) {
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
  rect(tileX*7, tileY*7.5, tileX*23, tileY*27.5, 25);

  //All winning numbers
  fill(0);
  textSize(width/25);
  textAlign(CENTER, CENTER);
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

    boolean isWinningTicket = false;
    for (int h = 0; h < winningTicketsID.size(); h++) {
      if (player.boughtTickets[h] == winningTicketsID.get(h)) {
        isWinningTicket = true;
        break;
      }
    }
    if (isWinningTicket) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    text(player.boughtTickets[i], tileX*11+tileX*2*(i%5), tileY*16.75+tileY*k);
  }
}


void wallet() {
  smallBox("Your wallet", 11);
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
  smallBox("Your Tickets", 15);

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
  smallBox("Bank", 10);

  textAlign(CENTER);
  textSize(width/45);

  text("Income from tickets    =    " + (totalTickets-remainingTickets)*ticketPrice, tileX*15, tileY*7.5);
  text("Expenses from tickets    =    " + (totalTickets-remainingTickets)*ticketCostPrice, tileX*15, tileY*8.5);
  text("Profit from tickets    =    " + (totalTickets-remainingTickets)*(ticketPrice-ticketCostPrice), tileX*15, tileY*9.5);
}

void raffle() {
  smallBox("Raffle", 10);

  textAlign(CENTER);
  textSize(width/45);


  for (int i = 0; i < amountBots; i++) {

    text(bots[i].fullName, tileX*15, tileY*7.25+tileY*i*2.5);
  }




  //int j = 0;
  //for (int i = 0; i < winningTicketsID.size(); i++) {
  //  if (i % 5 == 0 && i != 0) {
  //    j++;
  //  }
  //  text(winningTicketsID.get(i), tileX*11+tileX*2*(i%5), tileY*10.5+tileY*j);
  //}
}

void smallBox(String text, int heightBox) {
  rectMode(CORNERS);
  fill(255, 127, 0, 200);
  rect(tileX*10, tileY*5, tileX*20, tileY*heightBox, 25);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width/26);
  line(tileX*11, tileY*6.75, tileX*19, tileY*6.75);
  text(text, width/2, tileY*6);
}
