String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};

class Bots {

  String fullName;
  int tickets;

  Bots(String fullName) {
    this.fullName = fullName;
    this.tickets = ((int) random(totalTickets/10)); //See if I can return or reuse this number to make a loop in tickets(Needs to go through x amount of times
  }
}


//
