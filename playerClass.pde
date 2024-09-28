String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};
Player[] bots = new Player[amountBots];
int ticketPrice = 5;

class Player {

  String fullName;
  int wallet;
  int initialWallet;
  int gamble;
  int tickets;
  int[] boughtTickets = new int[totalTickets];
  int ticketCount = 0;

  Player(String fullName) {
    this.fullName = fullName;
    wallet = 10;
    initialWallet = wallet;
  }

  void ticket(int amountTickets) {
    if (wallet > 0) {
      for (int i = 0; i < amountTickets; i++) {
        int randomNumber = (int) random(remainingTickets);
        if (remainingTickets > 0){
        boughtTickets[ticketCount] = ticketsID.get(randomNumber);

        ticketCount++;
        tickets++;

        // Remove the randomNumber from ticketsID to prevent duplicate tickets
        ticketsID.remove(randomNumber);

        // Remove money from player
        wallet -= ticketPrice;
        // Add money to bank
        bank += ticketPrice;

        remainingTickets--;
        }
      }
    } else {
      rectMode(CORNERS);
      fill(255, 0, 0, 150);
      rect(tileX*5, tileY*20, tileX*9, tileY*21, 25);
      textAlign(CENTER, CENTER);
      textSize(width/70);
      fill(0);
      text("Insuficient funds", tileX*7, tileY*20.5); //Fix time
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
