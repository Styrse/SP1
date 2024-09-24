void printPlayerInfo(){
  println("Name: " + player.fullName);
  println("Wallet: " + player.wallet);
  println("Tickets: " + player.tickets);
  
  println("");
  
  for (int i = 0; i < player.boughtTickets[i]; i++) {
    println(player.boughtTickets[i]);
  }
}

void bankInfo(){
  println("Bank");
  println("Saldo: " + bank);
  
  println("");
  
  println("Tickets sold: " + (totalTickets-remainingTickets));
  println("Remaining tickets: " + remainingTickets);
}

void printBotNames(){
  //Print list of bots
  for (int i = 0; i <amountBots; i++){
    println("Name: " + bots[i].fullName);
    println("Wallet: " + bots[i].wallet);
    println("Tickets: " + bots[i].tickets);
    println("");
  }
}

void printTicketID(){
  //Print list of tickets ID
  for (int i = 0; i < remainingTickets; i++) {
    println(ticketsID.get(i));
  }
}
