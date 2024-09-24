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
