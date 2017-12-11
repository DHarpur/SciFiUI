class Menu {
  
  color outlineColor;
  float x, y, x2, y2;
  float buttonWidth;
  float buttonHeight;
  float gap;
  float buttonWGap, buttonHGap;
  String[] yesno = {"Yes", "No"};
  String[] planetNames = new String[5];
  
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
    gap = 240;
    int count = 0;
    for(int i = 0; i < planets.size() - 1; i++)
    {  
       fill(146, 169, 206);
       if(i == index)
       {
         fill(176, 197, 232);
       }
       rect(x + buttonWGap, y + buttonHGap, buttonWidth, buttonHeight);
       
       if(planets.get(i) == planets.get(planetNumber))
       {
         count++;
       }         
       fill(0);
       textSize(26);
       text(planetNames[count], (x+buttonWGap+50), (y+buttonHGap+100));
       buttonWGap = buttonWGap + gap;
       count++;
    }
    buttonWGap = 40;
    popMatrix();
  }
  
  void confirm()
  {
    pushMatrix();
    planetTemp = planets.get(index).planetIndex;
    stroke(outlineColor);
    fill(0,10);
    rect(x, y, x2, y2);
    fill(0);
    planetTemp+=1;
    text("Do you wish to Warp to " + planetNames[planetTemp] + "?", x+buttonWGap+200, y+50);
    gap = 540;
    for(int i = 0; i < 2; i++)
    {
      fill(146, 169, 206);
      if(i == indexC)
      {
        fill(176, 197, 232);
      }
      rect(x+buttonWGap, y+buttonHGap+25,buttonWidth+buttonWidth, buttonHeight-25);
      fill(0);
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
      changed = true;
    }
    else
    {
      state = 0;
      confirmed = false;
    }
  }
  
}