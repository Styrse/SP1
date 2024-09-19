import java.util.ArrayList;
int remainingTickets = totalTickets;

ArrayList<Integer> ticketsID = new ArrayList<Integer>(totalTickets);
int[] playerTickets = new int [remainingTickets];





void fillTicketArray() {
  int startTicketID = ((int) random (10)*100);      //This will start the ID at a "round number"

  for (int i = 0; i < totalTickets; i++) {
    ticketsID.add(startTicketID + i);
  }
}



//class Tickets {

//  int ID;
//  int purchasePrice = 5;
//  int costPrice = 3;

//  Tickets() {
//  }


//Start with one type of ticket and add more when it works and I got extra time
