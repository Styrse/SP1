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
  player.ticket(3);

  println("Name: " + player.fullName);
  println("Wallet: " + player.wallet);
  println("Tickets: " + player.tickets);

  println("");

  println("Bank");
  println("Saldo: " + bank);
  
  println("");


  //This prints a list of the tickets the player has bought
  //println("Player tickets:");
  //for (int i = 0; i < playerTickets.length; i++) {
  //  if (playerTickets[i] > 0) {
  //    println("Ticket: " + playerTickets[i]);
  //  }
  //}

  //Print list of tickets ID
  //for (int i = 0; i < remainingTickets; i++){
  //  println(ticketsID.get(i));
  //}

  //Print list of bots
  //for (int i = 0; i <amountBots; i++){
  //  println("Name: " + bots[i].fullName);
  //  println("Wallet: " + bots[i].wallet);
  //  println("Tickets: " + bots[i].tickets);
  //  println("");
  //}
}

void draw() {
  image(img, width/2, height/2, width, height);
  boxes();
  menu();
}
