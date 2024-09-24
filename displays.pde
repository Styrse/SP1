PImage img;
PImage wallet;
PImage tickets;
PImage coffee;

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
  //fill(255, 100);
  //rect(tileX*23, tileY*25, tileX*6, tileY*3);

  //Walkable area
  rectMode(CORNERS);
  fill(100, 50, 150, 50);
  rect(leftWalkableEdge, topWalkableEdge, rightWalkableEdge, bottomWalkableEdge);
}

void menu() {
  fill(255, 127, 50, 100);
  rectMode(CENTER);
  rect(width/2, tileY*2, width-tileX*2, tileY*2, 25);

  //Wallet
  wallet = loadImage("wallet.png");
  image(wallet, tileX*2.25, tileY*2, tileX*1.25, tileY*1.25);
  fill(0);
  textSize(tileY);
  textAlign(LEFT, CENTER);
  text(player.wallet, tileX*3.25, tileY*2);

  //Tickets
  tickets = loadImage("tickets.png");
  image(tickets, tileX*10, tileY*2, tileX*1.25, tileY*1.25);
  text(player.tickets, tileX*11, tileY*2);
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
  coffee = loadImage("coffee.png");
  image(coffee, playerXPosition, playerYPosition, tileX*4, tileY*4);
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

//void ticketBooth() {
//  if (playerXPosition > leftAccesBoxTicketBooth && playerXPosition < rightAccessBoxTicketBooth && playerYPosition < bottomAccessBoxTicketBooth && playerYPosition > topAccessBoxTicketBooth){
//    if (mouseX > leftClickAreaTicketBooth && mouseX < rightClickAreaTicketBooth && mouseY < bottomClickAreaTicketBooth && mouseY > topClickAreaTicketBooth){ //MouseClicked
//    mouseClicked();
//    }
//  }
//}

void mouseClicked(){
  if (playerXPosition > leftAccesBoxTicketBooth && playerXPosition < rightAccessBoxTicketBooth && playerYPosition < bottomAccessBoxTicketBooth && playerYPosition > topAccessBoxTicketBooth){
    if (mouseX > leftClickAreaTicketBooth && mouseX < rightClickAreaTicketBooth && mouseY < bottomClickAreaTicketBooth && mouseY > topClickAreaTicketBooth){ //MouseClicked
    println("Buy ticket");
    }
  }
}
