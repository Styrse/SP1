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

boolean moving = false;
boolean boxesOn = false;

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
  text("Use the arrow keys to moved around \nUse the mouse for interactions", width/2, height/5);
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
  if (mouseX < rightWallet && mouseX > leftWallet && mouseY < bottom && mouseY > top) {
    println("Wallet");
  } else if (mouseX < rightTickets && mouseX > leftTickets && mouseY < bottom && mouseY > top) {
    println("Tickets");
  } else if (mouseX < rightBank && mouseX > leftBank && mouseY < bottom && mouseY > top) {
    println("Bank");
  } else if (mouseX < rightRaffle && mouseX > leftRaffle && mouseY < bottom && mouseY > top) {
    println("Raffle");
  } else if (mouseX < rightHelp && mouseX > leftHelp && mouseY < bottom && mouseY > top) {
    boxesOn = !boxesOn;
  } else if (mouseX < rightLottery && mouseX > leftLottery && mouseY < bottom && mouseY > top) {
    println("Lottery");
  }
}
