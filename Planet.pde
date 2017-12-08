class Planet
{
  PImage planet;
  AudioPlayer greeting;
  float x, y;
  
  Planet(PImage planet, AudioPlayer greeting)
  {
    this.planet = planet;
    this.greeting = greeting;
    this.x = width;
    this.y = height;
  }
  
  void display()
  {
    planet.resize(width, height);
    image(planet, (width), (height));
  }
  void playSound()
  {
    greeting.rewind();
    greeting.play();
  }
}