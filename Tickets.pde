import java.util.ArrayList;
int remainingTickets = totalTickets;

ArrayList<Integer> ticketsID = new ArrayList<Integer>(totalTickets);





void fillTicketArray() {
  //This will start the ID at a "round number"
  int startTicketID = ((int) random (10)*100);

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
