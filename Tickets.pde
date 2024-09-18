import java.util.ArrayList;

//Start with one type of ticket and add more when it works and I got extra time

int[] ticketsID = new int [totalTickets];

class Tickets {

  int ID;
  int purchasePrice = 5;;
  int costPrice = 3;

  Tickets() {
  }
  
  void ticket(){
    println("Remove ticket from array");
  }
}

void fillTicketArray() {
  for (int i = 0; i < totalTickets; i++) {
    ticketsID[i] = i+1;
  }
}
