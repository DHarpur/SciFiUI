class Menu {
  
  color outlineColor;
  float x, y, x2, y2;
  float buttonWidth;
  float buttonHeight;
  float gap;
  float buttonWGap, buttonHGap;
  int index = 0;
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
  
  void displayMenu()
  {
    //pushMatrix();
    stroke(outlineColor);
    fill(0,10);
    rect(x, y, x2, y2);
    
    for(int i = 0; i < planets.size() - 1; i++)
    {  
       fill(146, 169, 206);
       rect(x + buttonWGap, y + buttonHGap, buttonWidth, buttonHeight);
       if(planets.get(i) != planets.get(planetNumber))
       {
         fill(0);
         text(planets.get(i)).toString(), (x+buttonWGap+50), (y+buttonHGap+50));
       }
       buttonWGap = buttonWGap + gap;
    }
    buttonWGap = 40;
    //popMatrix();
  }
  
  void confirm(){
    
  }
  
  void keyPressed()
  {
    //int keyCode = 
  }
}