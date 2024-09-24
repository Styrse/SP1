String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};
Player[] bots = new Player[amountBots];

class Player {

  String fullName;
  int wallet;
  int tickets;
  int[] boughtTickets = new int[totalTickets];

  Player(String fullName) {
    this.fullName = fullName;
    wallet = 100;
  }

  void ticket(int amountTickets) {
    for (int i = 0; i < amountTickets; i++) {
      int randomNumber = (int) random(remainingTickets);
      boughtTickets[i] = ticketsID.get(randomNumber);

      tickets++;

      //Remove randomNumber from ticketID[randomNumber];
      ticketsID.remove(randomNumber);
      //Remove money from player
      wallet -= 5;
      //Add money to bank
      bank += 5;

      remainingTickets --;
    }
  }
}

void makeBots() {
  for (int i = 0; i < amountBots; i++) {
    bots[i] = new Player(randomNameGenerator());

    bots[i].ticket((int) random(totalTickets/10));
  }
}

String randomNameGenerator() {
  //Takes the lenght of the two arrays and use them as "max" number in random. Random number is then used to pick a position in the list to get a firstname and a lastname.
  int randomNumberFirstName = (int) random(botFirstNames.length);
  int randomNumberLastName = (int) random(botLastNames.length);
  String fullName = botFirstNames[randomNumberFirstName] + " " + botLastNames[randomNumberLastName];

  return fullName;
}
