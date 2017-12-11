class Planet
{
  PImage planet;
  String name;
  int planetIndex;
  float x, y;
  
  Planet(PImage planet, String name, int planetIndex)
  {
    this.planet = planet;
    this.x = width;
    this.y = height;
    this.name = name;
    this.planetIndex = planetIndex;
  }
  
  void display()
  {
    planet.resize(width, height);
    image(planet, 0, 0);
  }
  
  String toString()
  {
    return name;
  }
}