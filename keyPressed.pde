void keyPressed() {
  if (start == true && typing == true) {
    if (key == BACKSPACE && playerName.length() > 0 && playerName.length() < 15) {
      playerName = playerName.substring(0, playerName.length()-1);
    } else if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      playerName += key;
      if (playerName.length() > 15) {
        playerName = playerName.substring(0, 15);
      }
    } else if (key == ENTER && playerName.length() > 0) {
      start = false;
    }
  } else if (tentOn == true && typing == true) {
    if (key == BACKSPACE && playerPick.length() > 0) {
      playerPick = playerPick.substring(0, playerPick.length()-1);
    } else if (Character.isDigit(key)) {
      playerPick += key;
      playerPickInt = Integer.parseInt(playerPick);
      playerPickInt = constrain(playerPickInt, 0, 36);
      playerPick = Integer.toString(playerPickInt);
    }
  }

  if (typing == true && ofelia == true) {
    if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      grade += key;
    } else if (key ==ENTER) {
      if (GradeStyr.equals(grade)) {
        character = 0;
      }
    }
  }

  if (motherload == true) {
    if (Character.isLetter(key) || key == ' ' || Character.isDigit(key)) {
      codeEntered += key;
    } else if (key ==ENTER) {
      if (codeEntered.equals(motherloadString)) {
        player.wallet += motherloadMoney;
        motherloadTrue = true;
        motherloadCount++;
      }
      codeEntered = "";
      motherload = false;
    }
  }

  if (start == false) {
    if (key == CODED) {
      if (keyCode == LEFT && !moving) {
        playerXPosition-= tileX*0.5;
      } else if (keyCode == RIGHT && !moving) {
        playerXPosition+= tileX*0.5;
      } else if (keyCode == UP && !moving) {
        playerYPosition-= tileY*0.5;
      } else if (keyCode == DOWN && !moving) {
        playerYPosition+= tileY*0.5;
      }
      walkSound = new SoundFile(this, "sounds/walk.wav");
      walkSound.play();
    }
  }

  playerXPosition = constrain(playerXPosition, leftWalkableEdge, rightWalkableEdge);
  playerYPosition = constrain(playerYPosition, topWalkableEdge, bottomWalkableEdge);
}

void keyReleased() {
  moving = false;
}
