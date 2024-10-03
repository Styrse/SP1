void fillTicketArray() {
  //This will start the ID at a "round number"
  int startTicketID = ((int) random (10)*100);

  for (int i = 0; i < totalTickets; i++) {
    ticketsID.add(startTicketID + i);
  }

  //Pick winning numbers
  getWinningNumbers();
}

void getWinningNumbers() {
  //Winning chance 20%
  winRate = (totalTickets/100)*20;

  for (int i = 0; i < winRate; i++) {
    int randomTicket = (int) random(1, ticketsID.size());
    if (!winningNumbers.contains(randomTicket)) {
      winningNumbers.add(randomTicket);
    } else {
      i--;
    }
  }

  for (int i = 0; i < winRate; i++) {
    winningTicketsID.add(ticketsID.get(winningNumbers.get(i)));
  }
}
