PImage noMoney;
String[] botFirstNames = {"Mette", "Lars", "Helle", "Anders", "Poul", "Anker", "Jens"};
String[] botLastNames = {"Krag", "Jørgensen", "Hartling", "Schlüter", "Rasmussen", "Thorning-Schmidt", "Frederiksen", "Fogh", "Nyrup", "Løkke"};

String playerName = "";

int ticketPrice = 5;
int ticketCostPrice = 3;

class Player {

  String fullName;
  int wallet;
  int initialWallet;
  int tickets;
  int gamble = 0;
  int[] boughtTickets = new int[totalTickets];
  int ticketCount = 0;

  Player(String fullName) {
    this.fullName = fullName;
    wallet = 100;
    initialWallet = wallet;
  }

  void ticket(int amountTickets) {
    if (wallet > 0) {
      for (int i = 0; i < amountTickets; i++) {
        int randomNumber = (int) random(remainingTickets);
        if (remainingTickets > 0) {
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
      noMoney = loadImage("data/images/icons/no-money.png");
      image(noMoney, tileX*6, tileY*19, tileX*2, tileY*2);
    }
  }

  public void movement() {

    for (int i = 0; i < amountBots; i++) {
      botXPosition[i] += random(-tileX*0.25, tileX*0.25);
      botYPosition[i] += random(-tileY*0.25, tileY*0.25);
      botXPosition[i] = constrain(botXPosition[i], leftWalkableEdge, rightWalkableEdge);
      botYPosition[i] = constrain(botYPosition[i], topWalkableEdge, bottomWalkableEdge);
    }
  }
}

void makeBots() {
  for (int i = 0; i < amountBots; i++) {
    bots[i] = new Player(randomNameGenerator());

    bots[i].ticket((int) random(6, totalTickets/12));
  }
}

String randomNameGenerator() {
  //Takes the lenght of the two arrays and use them as "max" number in random. Random number is then used to pick a position in the list to get a firstname and a lastname.
  int randomNumberFirstName = (int) random(botFirstNames.length);
  int randomNumberLastName = (int) random(botLastNames.length);
  String fullName = botFirstNames[randomNumberFirstName] + " " + botLastNames[randomNumberLastName];

  return fullName;
}
