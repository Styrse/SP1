import processing.sound.*;
import java.util.Collections;
import java.util.ArrayList;

Player bot;
int amountBots = 10;
int totalTickets = 100;
int tiles = 30;
float tileX;
float tileY;
Player player;
PFont myFont;

SoundFile carnivalSound;

float[] botXPosition = new float[amountBots];
float[] botYPosition = new float[amountBots];

Player[] bots = new Player[amountBots];

boolean soundPlayed = false;

//Bet
float  bet = 5;

float iconSizeX;
float iconSizeY;

float playerXPosition;
float playerYPosition;

//Walkable area
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

//Exit access area
float leftAccessExit;
float rightAccessExit;
float topAccessExit;
float bottomAccessExit;

//End game
float leftEndGame;
float rightEndGame;
float topEndGame;
float bottomEndGame;

//Roulette
float leftRoulette;
float rightRoulette;
float topRoulette;
float bottomRoulette;

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

//Player pick
float leftPickANumber;
float rightPickANumber;
float topPickANumber;
float bottomPickANumber;

//Flag
float leftFlag;
float rightFlag;
float topFlag;
float bottomFlag;

//Sky
float leftSky;
float rightSky;
float topSky;
float bottomSky;

//Popcorn
float leftPopcorn;
float rightPopcorn;
float topPopcorn;
float bottomPopcorn;

//Win or loss
float centerX;
float centerY;

void setup() {
  windowTitle("Fantasia Fairgrounds");
  size(900, 900);
  tileX = width/tiles;
  tileY = height/tiles;

  //Changes font
  myFont = loadFont("data/fonts/MVBoli-48.vlw");
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

  //Sets random starting position for the player
  playerXPosition = random(leftWalkableEdge, rightWalkableEdge);
  playerYPosition = random(topWalkableEdge, bottomWalkableEdge);

  //Sets random starting position for bots
  for (int i = 0; i < amountBots; i++) {
    botXPosition[i] = random(leftWalkableEdge, rightWalkableEdge);
    botYPosition[i] = random(topWalkableEdge, bottomWalkableEdge);
  }

  carnivalSound = new SoundFile(this, "sounds/carnival.wav");
  if (soundPlayed == false) {
    carnivalSound.loop();
    soundPlayed = true;
  }

  fillTicketArray();
  makeBots();
  player = new Player(playerName);
}
