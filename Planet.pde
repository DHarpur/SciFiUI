class Planet
{
  PImage planet;
  AudioPlayer greeting;
  String name;
  float x, y;
  
  Planet(PImage planet, AudioPlayer greeting, String name)
  {
    this.planet = planet;
    this.greeting = greeting;
    this.x = width;
    this.y = height;
    this.name = name;
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
}