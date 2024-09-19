import java.util.ArrayList;
int remainingTickets = totalTickets;

int[] ticketsID = new int [totalTickets];
int[] playerTickets = new int [remainingTickets];



void ticket(int tickets) {
  for (int i = 0; i < tickets; i++) {
    int randomNumber = (int) random(remainingTickets);
    println("Random number: " + randomNumber);
    println("Ticket ID: " + ticketsID[randomNumber]);
    //Take random number from ticketID[randomNumber} and add it to playerTickets;
    
    //Remove randomNumber from ticketID[randomNumber];
    
    remainingTickets --;
  }
}

void fillTicketArray() {
  int startTicketID = (int) random (999);      //Creates a random sequenze number for the ticket id to start at

  for (int i = 0; i < totalTickets; i++) {
    ticketsID[i] = startTicketID + i;
  }
}



//class Tickets {

//  int ID;
//  int purchasePrice = 5;
//  int costPrice = 3;

//  Tickets() {
//  }


//Start with one type of ticket and add more when it works and I got extra time
