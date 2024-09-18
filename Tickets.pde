import java.util.ArrayList;

//Make a loop which will fill an Array with numbers from 1 to 100.
//Start with one type of ticket and add more when it works and I got extra time

int[] ticketsID = new int [totalTickets];

class Tickets {

  int ID;
  int purchasePrice;
  int costPrice = 3;

  Tickets(int price) {
    this.purchasePrice = purchasePrice;
  }
}

void fillTicketArray() {
  for (int i = 0; i < totalTickets; i++) {
    ticketsID[i] = i+1;
  }
}






//Use Array and remove() to remove the numbers already bought
