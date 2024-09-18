String randomNmaeGenerator(){
  String fullName = "John Doe";
  
  //Takes the lenght of the two arrays and use them as "max" number in random. Random number is then used to pick a position in the list to get a firstname and a lastname.
  int randomNumberFirstName = (int) random(botFirstNames.length);
  int randomNumberLastName = (int) random(botLastNames.length);
  fullName = botFirstNames[randomNumberFirstName] + " " + botLastNames[randomNumberLastName];
  
  return fullName;
}
