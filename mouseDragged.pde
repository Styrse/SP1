//Mouse dragged is similar to mouseClicked for an improved user experience. Buying tickets has been left out to prevent buying multiple tickets
void mouseDragged() {
  if (start == false  && gameEnded == false && tentOn == false && clickPossible == true) {
    if (playerXPosition >= leftAccessBoxTent && playerXPosition <= rightAccessBoxTent && playerYPosition <= bottomAccessBoxTent && playerYPosition >= topAccessBoxTent) {
      if ( mouseX >= leftClickAreaTent && mouseX <= rightClickAreaTent && mouseY <= bottomClickAreaTent && mouseY >= topClickAreaTent) {
        if (walletOn == true || playerTicketsOn == true || bankOn == true || raffleOn == true || helpOn == true) {
          walletOn = false;
          playerTicketsOn = false;
          bankOn = false;
          raffleOn = false;
          helpOn = false;
        }
        tentOn = !tentOn;
      }
    }
    if (mouseX < rightWallet && mouseX > leftWallet && mouseY < bottom && mouseY > top) {
      if (playerTicketsOn == true || bankOn == true || raffleOn == true || helpOn == true) {
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      walletOn = !walletOn;
    } else if (mouseX < rightTickets && mouseX > leftTickets && mouseY < bottom && mouseY > top) {
      if (walletOn == true || bankOn == true || raffleOn == true || helpOn == true) {
        walletOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      playerTicketsOn = !playerTicketsOn;
    } else if (mouseX < rightBank && mouseX > leftBank && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || raffleOn == true || helpOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      bankOn = !bankOn;
    } else if (mouseX < rightRaffle && mouseX > leftRaffle && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || bankOn == true || helpOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
        helpOn = false;
      }
      raffleOn = !raffleOn;
    } else if (mouseX < rightHelp && mouseX > leftHelp && mouseY < bottom && mouseY > top) {
      if (walletOn == true || playerTicketsOn == true || bankOn == true || raffleOn == true) {
        walletOn = false;
        playerTicketsOn = false;
        bankOn = false;
        raffleOn = false;
      }
      helpOn = !helpOn;
    } else if (mouseX < rightLottery && mouseX > leftLottery && mouseY < bottom && mouseY > top) {
      if (helpOn == true) {
        helpOn = false;
      }
      gameEnded = true;
    } else if (mouseX < rightMotherload && mouseX > leftMotherload && mouseY < bottomMotherload && mouseY > topMotherload) {
      rollercoasterSound = new SoundFile(this, "sounds/rollercoaster.wav");
      rollercoasterSound.play();
      motherload = true;
    }
    if (mouseX < rightCross && mouseX > leftCross && mouseY < bottomCross && mouseY > topCross) {
      walletOn = false;
      playerTicketsOn = false;
      bankOn = false;
      raffleOn = false;
    } else if (mouseX < rightPopcorn && mouseX > leftPopcorn && mouseY < bottomPopcorn && mouseY > topPopcorn) {
      clickPossible = false;
      walletOn = false;
      playerTicketsOn = false;
      bankOn = false;
      raffleOn = false;
      helpOn = false;
      popcornOn = true;
      savedTime = millis();
      popcornTrue = true;
    } else if (mouseX < rightSky && mouseX > leftSky && mouseY < bottomSky && mouseY > topSky) {
      thunderSound = new SoundFile(this, "sounds/thunder.wav");
      thunderSound.play();
      skyTrue = true;
    } else if (mouseX < rightFlag && mouseX > leftFlag && mouseY < bottomFlag && mouseY > topFlag) {
      windSound = new SoundFile(this, "sounds/wind.wav");
      windSound.play();
      flagTrue = true;
    }
  } else if (start == true) {
    if (start == true && mouseX < rightUsername && mouseX > leftUsername && mouseY < bottomUsername && mouseY > topUsername) {
      typing = true;
    } else if (mouseX < rightEnter && mouseX > leftEnter && mouseY < bottomEnter && mouseY > topEnter && playerName.length() > 0) {
      start = false;
    }
  } else if (gameEnded == true) {
    if (mouseX < rightEndGame && mouseX > leftEndGame && mouseY < bottomEndGame && mouseY > topEndGame) {
      exit();
    }
  } else if (tentOn == true) {
    if (playerXPosition <= rightAccessExit && playerXPosition >= leftAccessExit && playerYPosition <= bottomAccessExit && playerYPosition >= topAccessExit) {
      if (mouseX < rightExit && mouseX > leftExit && mouseY < bottomExit && mouseY > topExit) {
        playerXPosition = tileX*23;
        playerYPosition = tileY*23.5;
        tentOn = false;
        boxesTent = false;
      }
    }
    if ( mouseX < rightHelp && mouseX > leftHelp && mouseY < bottom && mouseY > top) {
      boxesTent = !boxesTent;
    }
    if (mouseX < rightDownArrow && mouseX > leftDownArrow && mouseY < bottomDownArrow && mouseY > topDownArrow) {
      bet -= 5;
    } else if (mouseX < rightUpArrow && mouseX > leftUpArrow && mouseY < bottomUpArrow && mouseY > topUpArrow) {
      bet += 5;
    }
    bet = constrain(bet, 0, player.wallet);

    if (mouseX < rightOdd && mouseX > leftOdd && mouseY < bottomOdd && mouseY > topOdd) {
      number = 1;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightEven && mouseX > leftEven && mouseY < bottomEven && mouseY > topEven) {
      number = 2;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightRed && mouseX > leftRed && mouseY < bottomRed && mouseY > topRed) {
      number = 3;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightGreen && mouseX > leftGreen && mouseY < bottomGreen && mouseY > topGreen) {
      number = 4;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightPickANumber && mouseX > leftPickANumber && mouseY < bottomPickANumber && mouseY > topPickANumber) {
      number = 5;
      if (bet > 0) {
        betOn = true;
      }
    } else if (mouseX < rightRoulette && mouseX > leftRoulette && mouseY < bottomRoulette && mouseY > topRoulette && betOn == true) {
      player.wallet -= bet;
      player.gamble -= bet;
      roulette();
    }
  }
}
