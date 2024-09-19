Bots bot;
int amountBots = 10;
int totalTickets = 100;

void setup() {
  size(600, 600);
  backgroundFunction();

//Creates an object of the class Bots. Uses the function/method to assign a random name to the bot.
  Bots bot1 = new Bots(randomNameGenerator());
  println("Bot Name: " + bot1.fullName);
  println("Bought tickets: " + bot1.tickets);

  fillTicketArray();
  makeBots();
  
  
  
  
  
  
  
  //for (int i = 0; i <amountBots; i++){
  //  println(bots[i].fullName);
  //  println(bots[i].tickets);
  //}
  
}

void draw(){
  image(img, width/2, height/2, width, height);
}
