Player bot;
int amountBots = 10;
int totalTickets = 100;
float tileX;
float tileY;
Player player;


void setup() {
  size(900, 900);
  tileX = width/30;
  tileY = height/30;


  iconSizeX = tileX*1.25;
  iconSizeY = tileY*1.25;

  //Walkable area
  leftWalkableEdge = tileX;
  rightWalkableEdge = width-tileX;
  topWalkableEdge = tileY*23.5;
  bottomWalkableEdge = height-tileX;

  //Access area ticket booth
  leftAccesBoxTicketBooth = tileX*2;
  rightAccessBoxTicketBooth = tileX*7;
  topAccessBoxTicketBooth = tileY*23.5;
  bottomAccessBoxTicketBooth = tileY*26;

  //Enter click area ticket booth
  leftClickAreaTicketBooth = tileX*3;
  rightClickAreaTicketBooth = tileX*6;
  topClickAreaTicketBooth = tileY*20.5;
  bottomClickAreaTicketBooth = tileY*24.5;

  //Access area tent
  leftAccessBoxTent = tileX*20;
  rightAccessBoxTent = tileX*26;
  topAccessBoxTent = tileY*23.5;
  bottomAccessBoxTent = tileY*26;

  //Enter click area tent
  leftClickAreaTent = tileX*21.25;
  rightClickAreaTent = tileX*24.65;
  topClickAreaTent = tileY*21.5;
  bottomClickAreaTent = tileY*24.75;

  //Menu
  top = tileY*1.3;
  bottom = top+iconSizeY;
  //Wallet
  leftWallet = tileX*1.75;
  rightWallet = leftWallet+iconSizeX;

  //Tickets
  leftTickets = tileX*7.75;
  rightTickets = leftTickets+iconSizeX;

  //Bank
  leftBank = tileX*13.75;
  rightBank = leftBank+iconSizeX;

  //Raffle
  leftRaffle = tileX*19.75;
  rightRaffle = leftRaffle+iconSizeX;

  //Help
  leftHelp = tileX*24.25;
  rightHelp = leftHelp+iconSizeX;

  //Lottery
  leftLottery = tileX*26.75;
  rightLottery = leftLottery+iconSizeX;
  
  //Username box
  leftUsername = tileX*10;
  rightUsername = tileX*20;
  topUsername = tileY*19;
  bottomUsername = tileY*20.5;
  
  //Enter box
  leftEnter = tileX*13;
  rightEnter = tileX*17;
  topEnter = tileY*21;
  bottomEnter = tileY*22;

  playerXPosition = random(leftWalkableEdge, rightWalkableEdge);
  playerYPosition = random(topWalkableEdge, bottomWalkableEdge);

  backgroundFunction();

  fillTicketArray();
  makeBots();
  player = new Player(playerName);
}

void draw() {
  image(img, width/2, height/2, width, height);

  menu();
  if (boxesOn == true) {
    boxes();
  }
  makePlayer();

  if (start == true) {
    startInfo();
  }
}
