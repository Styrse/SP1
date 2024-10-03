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
  arrows = loadImage("data/images/icons/keyboard.png");
  image(arrows, tileX*12, tileY*9.5, tileX*2.5, tileY*2.5);
  //Mouse
  mouse = loadImage("data/images/icons/mouse.png");
  image(mouse, tileX*18, tileY*9.5, tileX*2.5, tileY*2.5);

  fill(0);
  textAlign(CENTER);
  textSize(width/45);
  text("Use the arrow keys to move around \nUse the mouse for interactions", width/2, height/5);
}

void boxesTent() {
  rectMode(CORNERS);
  noFill();
  rect(leftExit, topExit, rightExit, bottomExit, 5);
  rect(leftAccessExit, topAccessExit, rightAccessExit, bottomAccessExit, 5);
  rect(leftHelp, top, rightHelp, bottom, 5);
  rect(leftWalkableEdge, topWalkableEdge, rightWalkableEdge, bottomWalkableEdge, 5);
}
