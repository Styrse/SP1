Bots bot;
int amountBots = 10;
int totalTickets = 100;

void setup(){
  size(60, 60);
  
  Tickets oneTicket = new Tickets(5);
  Tickets fiveTickets = new Tickets(20);
  
  
  Bots bot1 = new Bots(randomNameGenerator());
  println("Bot Name: " + bot1.fullName);
  println("Bought tickets: " + bot1.tickets);
  
  fillTicketArray();
  println(ticketsID[50]);

}
