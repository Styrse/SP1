Bots bot;
int amountBots = 10;
int totalTickets = 1000;

void setup(){
  size(600, 600);
  
  for (int i = 1; i < amountBots; i ++){
    String fullName = randomNmaeGenerator();
   
    Bots bot+i = new Bots(fullName);
    println(bot.fullName);
    
  }
  println(randomNmaeGenerator());
  
  

}
