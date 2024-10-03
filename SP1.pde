Player bot;
int amountBots = 10;
int totalTickets = 100;
int tiles = 30;
float tileX;
float tileY;
Player player;
PFont myFont;

float[] botXPosition = new float[amountBots];
float[] botYPosition = new float[amountBots];


void setup() {
  windowTitle("Fantasia Fairgrounds");
  size(900, 900);
  tileX = width/tiles;
  tileY = height/tiles;
  
  //Changes font
  myFont = loadFont("C:/Users/Styrse/OneDrive/Desktop/GitHub/Projects/SP1/data/MVBoli-48.vlw");
  textFont(myFont);

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

  //Motherload
  leftMotherload = tileX*5.5;
  rightMotherload = tileX*8.75;
  topMotherload = tileY*14.75;
  bottomMotherload = tileY*16.25;
  
  //Cross
  leftCross = tileX*18.5;
  rightCross = leftCross+tileX;
  topCross = tileY*5.5;
  bottomCross = topCross+tileY;
  
  //Exit
  leftExit = tileX*3;
  rightExit = tileX*5;
  topExit = tileY*18.5;
  bottomExit = tileY*23.5;
  
  //Exit access area
  leftAccessExit = tileX*1;
  rightAccessExit = tileX*7;
  topAccessExit = topWalkableEdge;
  bottomAccessExit = topAccessExit+tileY*3;
  
  //End game
  leftEndGame = tileX*13.5;
  rightEndGame = tileX*16.5;
  topEndGame = tileY*22;
  bottomEndGame = tileY*25;
  
  //Roulette
  leftRoulette = tileX*12.5;
  rightRoulette = tileX*17.5;
  topRoulette = tileY*20;
  bottomRoulette = tileY*24;
  
  //Betting arrows
  leftDownArrow = tileX*4.625;
  rightDownArrow = tileX*6.375;
  topDownArrow = tileY*10.25;
  bottomDownArrow = tileY*12;
  
  leftUpArrow = rightDownArrow+tileX;
  rightUpArrow = leftUpArrow+tileX*1.75;
  topUpArrow = topDownArrow;
  bottomUpArrow = bottomDownArrow;
  
  //Odd/Even
  leftOdd = tileX*11;
  rightOdd = leftOdd+tileX*2;
  topOdd = tileY*9;
  bottomOdd = topOdd+tileY*2;
  
  leftEven = leftOdd+tileX*2.5;
  rightEven = leftEven+tileX*2;
  topEven = topOdd;
  bottomEven = bottomOdd;
  
  //Red/Green
  leftRed = leftOdd+tileX*5.5;
  rightRed = leftRed+tileX*2;
  topRed = topOdd;
  bottomRed = topRed+tileY*2;
  
  leftGreen = leftRed+tileX*2.5;
  rightGreen = leftGreen+tileX*2;
  topGreen = topOdd;
  bottomGreen = bottomOdd;
  
  //Pick a number
  leftPickANumber = rightEven+tileX*7.625;
  rightPickANumber = leftPickANumber+tileX*2;
  topPickANumber = topOdd;
  bottomPickANumber = bottomOdd;
  
  //Flag
  leftFlag = tileX*23;
  rightFlag = tileX*26;
  topFlag = tileY*12;
  bottomFlag = tileY*13.5;
  
  //Sky
  leftSky = tileX*10;
  rightSky = tileX*15.75;
  topSky = tileY*3.5;
  bottomSky = tileY*6;
  
  //Popcorn
  leftPopcorn = tileX*8.5;
  rightPopcorn = tileX*10.25;
  topPopcorn = tileY*20.75;
  bottomPopcorn = tileY*24.75;
  
  //Win or loss
  centerX = tileX*18;
  centerY = tileY*20;

  playerXPosition = random(leftWalkableEdge, rightWalkableEdge);
  playerYPosition = random(topWalkableEdge, bottomWalkableEdge);

  for (int i = 0; i < amountBots; i++) {
    botXPosition[i] = random(leftWalkableEdge, rightWalkableEdge);
  }

  for (int i = 0; i < amountBots; i++) {
    botYPosition[i] = random(topWalkableEdge, bottomWalkableEdge);
  }


  backgroundFunction();

  fillTicketArray();
  makeBots();
  player = new Player(playerName);
}

void draw() {
  image(img, width/2, height/2, width, height);


  menu();
  loadBots();
  if (helpOn == true) {
    boxes();
  } else if (start == true) {
    startInfo();
  } else if (gameEnded == true) {
    displayEndScreen();
  } else if (walletOn == true) {
    wallet();
  } else if (playerTicketsOn == true) {
    playerTickets();
  } else if (bankOn == true) {
    bank();
  } else if (raffleOn == true) {
    raffle();
  } else if (tentOn == true) {
    tent();
  } 
  
  if (popcornOn == true){
    passedTime = millis() - savedTime;
    popcorn();
  }

  loadPlayer();
  bots[1].movement();
}
