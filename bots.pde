String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};
Bots[] bots = new Bots[amountBots];


class Bots {

  String fullName;
  int tickets;

  Bots(String fullName) {
    this.fullName = fullName;
    this.tickets = ((int) random(totalTickets/10));
  }
}

void makeBots() { //Can I make the bots here
  for (int i = 0; i < amountBots; i++) {
    bots[i] = new Bots(randomNameGenerator());
  }
}



//Make map to see how many tickets one bot has bought
//Make a loop that buy x amount of tickets. Connect ticketID to bot
//Make if/else statements to decide which type of tickets to buy
//this.tickets = ((int) random(totalTickets/10)); //See if I can return or reuse this number to make a loop in tickets(Needs to go through x amount of times
