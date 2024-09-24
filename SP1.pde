Player bot;
int amountBots = 10;
int totalTickets = 100;
float tileX;
float tileY;
Player player;
float leftWalkableEdge;
float rightWalkableEdge;
float topWalkableEdge;
float bottomWalkableEdge;

void setup() {
  size(900, 900);
  tileX = width/30;
  tileY = height/30;
  leftWalkableEdge = tileX;
  rightWalkableEdge = tileY*23.5;
  topWalkableEdge = width-tileX;
  bottomWalkableEdge = height-tileX;
  
  backgroundFunction();

  fillTicketArray();
  makeBots();
  player = new Player(playerName);
  player.ticket(3);
}

void draw() {
  image(img, width/2, height/2, width, height);
  boxes();
  menu();
}
