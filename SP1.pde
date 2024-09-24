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

  playerXPosition = random(leftWalkableEdge, rightWalkableEdge);
  playerYPosition = random(topWalkableEdge, bottomWalkableEdge);

  backgroundFunction();

  fillTicketArray();
  makeBots();
  player = new Player(playerName);
  //player.ticket(3);
}

void draw() {
  image(img, width/2, height/2, width, height);
  boxes();
  menu();
  makePlayer();
  

}
