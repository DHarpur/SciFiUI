class Menu {
  
  color outlineColor;
  float x, y, x2, y2;
  float buttonWidth;
  float buttonHeight;
  float gap;
  float buttonWGap, buttonHGap;
  String[] yesno = {"Yes", "No"};
  String[] planetNames = new String[5];
  int planetTemp;
  String[] totalPrintedPlanets = new String[4];
  
  Menu()
  {
    outlineColor = color(19, 103, 110);
    x = 460;
    y = 300;
    x2 = 1000;
    y2 = 440;
    buttonWidth = 200;
    gap = 240;
    buttonWGap = 40;  
    buttonHGap = 120;
    buttonHeight = 200;
    planetTemp = 0;
  }
  
  void initialisePlanetNames()
  {
    for(int i = 0; i < planetNames.length; i++)
    {
      planetNames[i] = "" + ((planets.get(i)).toName());
    }
  }
  
  void displayMenu()
  {
    initialisePlanetNames();
    pushMatrix();
    stroke(outlineColor);
    fill(0,10);
    rect(x, y, x2, y2);
    fill(255);
    text("Warp Destination:", x+buttonWGap+200, y+50);
    gap = 240;
    Planet currentPlanet = planets.get(planetNumber);
    int count = 0;
    for(int i = 0; i < planetNames.length-1; i++)
    {  
       fill(146, 169, 206);
       if(i == index)
       {
         fill(176, 197, 232);
       }
       rect(x + buttonWGap, y + buttonHGap, buttonWidth, buttonHeight);
       
       if(currentPlanet != planets.get(count))
       {
         fill(255);
         textSize(26);
         text(planetNames[count], (x+buttonWGap+50), (y+buttonHGap+100));
         totalPrintedPlanets[i] = planetNames[count];
       }
       else
       {
         int pIndex = currentPlanet.planetIndex;
         fill(255);
         textSize(26);
         text(planetNames[pIndex+1], (x+buttonWGap+50), (y+buttonHGap+100));
         totalPrintedPlanets[i] = planetNames[pIndex+1];
         count++;
       }
       count++;
       buttonWGap = buttonWGap + gap;
    }
    buttonWGap = 40;
    popMatrix();
  }
  
  void confirm()
  {
    confirmed = true;
    pushMatrix();
    for(int i = 0; i < planets.size(); i++)
    {
      if(planets.get(i).toName().equals(totalPrintedPlanets[index]))
      {
        planetTemp = planets.get(i).planetIndex;
      }
    }
    stroke(outlineColor);
    fill(0,10);
    rect(x, y, x2, y2);
    fill(255);
    text("Do you wish to Warp to " + totalPrintedPlanets[index] + "?", x+buttonWGap+200, y+50);
    gap = 540;
    for(int i = 0; i < 2; i++)
    {
      fill(146, 169, 206);
      if(i == indexC)
      {
        fill(176, 197, 232);
      }
      rect(x+buttonWGap, y+buttonHGap+25,buttonWidth+buttonWidth, buttonHeight-25);
      fill(255);
      textSize(26);
      text(yesno[i], (x+buttonWGap+160), y+buttonHGap+125);
      buttonWGap = buttonWGap + gap;
    }
    buttonWGap = 40;
    popMatrix();
  }
  
  void changePlanet()
  {
    if(yesno[indexC].equals("Yes"))
    {
      planetNumber = planetTemp;
      warped=true;
      changed = false;
    }
    else
    {
      state = 0;
      confirmed = false;
    }
  }
  
}