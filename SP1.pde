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

float[] botXPosition = new float[amountBots];
float[] botYPosition = new float[amountBots];

SoundFile carnivalSound;
boolean soundPlayed = false;

PImage img;
PImage tentBackground;
PImage roulette;
PImage wallet;
PImage tickets;
PImage coffee;
PImage bankIMG;
PImage raffle;
PImage help;
PImage lottery;
PImage arrows;
PImage mouse;
PImage cross;
PImage exit;
PImage endGame;
PImage arrowUp;
PImage arrowDown;
PImage win;
PImage loss;
PImage cat;
PImage popcorn;
PImage[] botImages = new PImage[10];
String[] imageName = {"avocado", "bread", "burger", "can", "cookie", "doughnut", "frenchfries", "pineapple", "pizza", "tomato"};
int[] redNumbers = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};

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

//Bet
float  bet = 5;

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

boolean moving = false;
boolean flagTrue = false;
boolean walletOn = false;
boolean motherload = false;
boolean motherloadTrue = false;
boolean playerTicketsOn = false;
boolean bankOn = false;
boolean raffleOn = false;
boolean helpOn = false;
boolean gambleTrue = false;
boolean tentOn = false;
boolean popcornTrue = false;
boolean start = true;
boolean typing = false;
boolean skyTrue = false;
boolean gameEnded = false;
boolean betOn = false;
boolean boxesTent = false;
boolean ofelia = false;
boolean popcornOn = false;
boolean catSoundOn = false;
boolean endSoundOn = false;

String codeEntered = "";
String motherloadString = "Motherload";
String playerPick = "";
String grade = "";
String GradeStyr = "A";

int winRate;
int motherloadCount = 0;
int motherloadMoney = 1000;
int bank = 0;
int number = 0;
int playerPickInt;
int character = 1;
int savedTime;
int passedTime;

ArrayList<Integer> winningNumbers = new ArrayList<Integer>();
ArrayList<Integer> winningTicketsID = new ArrayList<Integer>();

SoundFile popcornSound;
SoundFile rouletteSound;
SoundFile ticketsSound;
SoundFile winSound;
SoundFile catSound;
SoundFile endSound;
SoundFile walkSound;

int remainingTickets = totalTickets;

ArrayList<Integer> ticketsID = new ArrayList<Integer>(totalTickets);
