PImage img;
PImage wallet;
PImage tickets;
PImage coffee;
PImage bankIMG;
PImage raffle;
PImage help;
PImage lottery;

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

boolean moving= false;



void backgroundFunction() {
  imageMode(CENTER);
  img = loadImage("carnival_background.jpg");
}

//Make boxes to visualize areas. Should not be called when code is done.
void boxes() {
  tileX = width/30;
  tileY = height/30;

  rectMode(CORNERS);
  strokeWeight(3);
  //Ticket booth
  fill(0, 100);
  rect(leftAccesBoxTicketBooth, topAccessBoxTicketBooth, rightAccessBoxTicketBooth, bottomAccessBoxTicketBooth);
  fill(255, 100);
  rect(leftClickAreaTicketBooth, topClickAreaTicketBooth, rightClickAreaTicketBooth, bottomClickAreaTicketBooth);
  //Tent
  fill(0, 100);
  rect(leftAccessBoxTent, topAccessBoxTent, rightAccessBoxTent, bottomAccessBoxTent);
  fill(255, 100);
  rect(leftClickAreaTent, topClickAreaTent, rightClickAreaTent, bottomClickAreaTent);

  //Walkable area
  fill(100, 50, 150, 50);
  rect(leftWalkableEdge, topWalkableEdge, rightWalkableEdge, bottomWalkableEdge);
  
  //Menu
  //Wallet
  rect(leftWallet, top, rightWallet, bottom);
  //Tickets
  rect(leftTickets, top, rightTickets, bottom);
  //Bank
  rect(leftBank, top, rightBank, bottom);
  //Raffle
  rect(leftRaffle, top, rightRaffle, bottom);
  //Help
  rect(leftHelp, top, rightHelp, bottom);
  //Lottery
  rect(leftLottery, top, rightLottery, bottom);
}

void menu() {

  fill(255, 127, 50, 100);
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

void infoBox() {
  fill(127, 99);
  rectMode(CORNER);
  rect(tileX*24, tileY*5, tileX*5, tileY*10, 25);

  textSize(tileX);
  fill(0);
  text("Use arrows to move", tileX*26.5, tileY*12);
}

void makePlayer() {
  imageMode(CENTER);
  coffee = loadImage("coffee.png");
  image(coffee, playerXPosition, playerYPosition, tileX*4, tileY*4);
  //Name tag
  rectMode(CORNERS);
  fill(0, 255, 0, 85);
  rect(playerXPosition-tileX*2, playerYPosition-tileY*3, playerXPosition+tileX*2, playerYPosition-tileY*2.2, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(tileY*0.4);
  text(playerName, playerXPosition, playerYPosition-tileY*2.6);
}

//Make movement for player
void keyPressed() {
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

  playerXPosition = constrain(playerXPosition, leftWalkableEdge, rightWalkableEdge);
  playerYPosition = constrain(playerYPosition, topWalkableEdge, bottomWalkableEdge);
}

void keyReleased() {
  moving = false;
}

void mouseClicked() {
  if (playerXPosition >= leftAccesBoxTicketBooth && playerXPosition <= rightAccessBoxTicketBooth && playerYPosition <= bottomAccessBoxTicketBooth && playerYPosition >= topAccessBoxTicketBooth) {
    if (mouseX >= leftClickAreaTicketBooth && mouseX <= rightClickAreaTicketBooth && mouseY <= bottomClickAreaTicketBooth && mouseY >= topClickAreaTicketBooth) {
      player.ticket(1);
      println("Ticket bought");
      printPlayerInfo();
    }
  } else if (playerXPosition >= leftAccessBoxTent && playerXPosition <= rightAccessBoxTent && playerYPosition <= bottomAccessBoxTent && playerYPosition >= topAccessBoxTent) {
    if ( mouseX >= leftClickAreaTent && mouseX <= rightClickAreaTent && mouseY <= bottomClickAreaTent && mouseY >= topClickAreaTent) {
      tent();
    }
  }
}
