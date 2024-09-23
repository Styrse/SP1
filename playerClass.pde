String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};
Player[] bots = new Player[amountBots];

int[][] boughtTickets = new int [amountBots+players][totalTickets];

class Player {

  String fullName;
  float wallet;
  int tickets;
  boolean isPlayer;

  Player(String fullName, boolean isPlayer) {
    this.fullName = fullName;
    this.isPlayer = isPlayer;
    wallet = 100;
  }

  void ticket(int amountTickets) {
    for (int i = 0; i < amountTickets; i++) {
      //Saves the random number to use it multiple times
      int randomNumber = (int) random(remainingTickets);

      if (isPlayer == true) {
        boughtTickets[0][i] = ticketsID.get(randomNumber);
      } else {
        for (int j = 1; j < boughtTickets.length; j++) {
          boughtTickets[j][i] = ticketsID.get(randomNumber);
        }
      }
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
    bots[i] = new Player(randomNameGenerator(), false);

    bots[i].ticket((int) random(totalTickets/10));
  }
}
