void startInfo() {
  rectMode(CENTER);
  fill(255, 127, 0, 200);
  rect(width/2, height/2, width/2, height/2, 25);
  line(tileX*8, tileY*11, tileX*22, tileY*11);
  line(tileX*8, tileY*17, tileX*22, tileY*17);

  textAlign(CENTER, CENTER);
  textSize(width/45);
  fill(0);
  text("Enjoy a sunny day at the " + '"' + "Fantasia Fairgrounds" + '"' + "\nBuy some lottery tickets or gamble in the tent", width/2, tileY*9.5);
  strokeWeight(1.5);

  text("To finish the day and see what you won \nclick this icon in the top right corner.", width/2, tileY*12.5);
  imageMode(CENTER);
  lottery = loadImage("data/images/icons/lottery.png");
  image(lottery, width/2, height/2, iconSizeX*2, iconSizeY*2);

  //Username
  text("Please enter your name by clicking the box below.", width/2, tileY*17.75);
  textSize(width/65);
  text("Max 15 chracters", width/2, tileY*18.5);
  fill(255);
  rectMode(CORNERS);
  rect(leftUsername, topUsername, rightUsername, bottomUsername, 25);
  fill(0);
  textSize(tileX*1.15);
  text(playerName, width/2, tileY*19.75);

  //Change colour of the "Enter" box to show user they can continue
  if (playerName.length() <= 0) {
    fill(127);
  } else {
    fill(0, 255, 0);
  }
  rect(leftEnter, topEnter, rightEnter, bottomEnter, 25);
  textSize(width/35);
  fill(0);
  text("Enter", width/2, tileY*21.5);
}
