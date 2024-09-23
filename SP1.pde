Player bot;
int amountBots = 10;
int players = 1;
int totalTickets = 100;
float tileX;
float tileY;

void setup() {
  size(900, 900);
  backgroundFunction();

  fillTicketArray();
  makeBots();
  Player player = new Player(playerName, true);
  player.ticket(3);

  println("Name: " + player.fullName);
  println("Wallet: " + player.wallet);
  println("Tickets: " + player.tickets);

  println("");

  println("Bank");
  println("Saldo: " + bank);

  println("");

  println("Tickets sold: " + (totalTickets-remainingTickets));
  println("Remaining tickets: " + remainingTickets);

  println("");

  //Only prints the lines with information greater than 0
  for (int i = 0; i < amountBots+players; i++) {
    for (int j = 0; j < totalTickets; j++) {
      if (boughtTickets[i][j] > 0) {
        println(boughtTickets[i][j]);
      }
    }
    println("");
  }

  println("");
  
  println(boughtTickets[2]);

  //This prints a list of the tickets the player has bought
  //println("Player tickets:");
  //for (int i = 0; i < playerTickets.length; i++) {
  //  if (playerTickets[i] > 0) {
  //    println("Ticket: " + playerTickets[i]);
  //  }
  //}

  //Print list of tickets ID
  //for (int i = 0; i < remainingTickets; i++) {
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
