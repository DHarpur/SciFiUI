class Planet
{
  PImage planet;
  AudioPlayer greeting;
  String name;
  int planetIndex;
  float x, y;
  
  Planet(PImage planet, AudioPlayer greeting, String name, int planetIndex)
  {
    this.planet = planet;
    this.greeting = greeting;
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
  void playSound()
  {
    greeting.rewind();
    greeting.play();
  }
  
  String toString()
  {
    return name;
  }
  void stopSound()
  {
    greeting.close();
  }
}