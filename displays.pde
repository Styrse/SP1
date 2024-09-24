PImage img;
PImage wallet;
PImage tickets;

void backgroundFunction() {
  imageMode(CENTER);
  img = loadImage("carnival_background.jpg");
}

//Make boxes to visualize areas. Should not be called when code is done.
void boxes() {
  tileX = width/30;
  tileY = height/30;

  rectMode(CENTER);
  strokeWeight(3);
  //Ticket booth
  fill(0, 100);
  rect(tileX*4.5, tileY*22.5, tileX*3, tileY*4);
  fill(255, 100);
  rect(tileX*4.5, tileY*25, tileX*5, tileY*3);
  //Tent
  fill(0, 100);
  rect(tileX*23, tileY*23.25, tileX*3.25, tileY*3);
  fill(255, 100);
  rect(tileX*23, tileY*25, tileX*6, tileY*3);
  
  //Walkable area
  rectMode(CORNERS);
  fill(100, 50, 150, 50);
  rect(leftWalkableEdge, rightWalkableEdge, topWalkableEdge, bottomWalkableEdge);
}

void menu() {
  fill(255, 127, 50, 100);
  rectMode(CENTER);
  rect(width/2, tileY*2, width-tileX*2, tileY*2, 50);
  
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
