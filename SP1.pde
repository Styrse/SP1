Player bot;
int amountBots = 10;
int totalTickets = 100;
float tileX;
float tileY;

void setup() {
  size(900, 900);
  backgroundFunction();

  fillTicketArray();
  makeBots();



  Player player = new Player(playerName);
  println("Name: " + player.fullName);
  println("Wallet: " + player.wallet);
  println("Tickets: " + player.tickets);

  println(playerTickets.length);
  
  player.ticket(3);
  
  println(player.wallet);
  println(ticketsID);

  //for (int i = 0; i < playerTickets.length; i++){
  //  println(playerTickets[i]);
  //}

  println(" ");

  println("Bank");
  println("Saldo: " + bank);

  //Print list of tickets ID
  //for (int i = 0; i < totalTickets; i++){
  //  println(ticketsID[i]);
  //}

  //Print list of bots
  //for (int i = 0; i <amountBots; i++){
  //  println("Name: " + bots[i].fullName);
  //  println("Wallet: " + bots[i].wallet);
  //  println("Tickets: " + bots[i].tickets);
  //}
}

void draw() {
  image(img, width/2, height/2, width, height);
  boxes();
  menu();
}
