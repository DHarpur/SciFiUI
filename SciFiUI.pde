import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


void setup()
{
  minim = new Minim(this);
  fullScreen();
  background(0);
  initialisePlanets();
  setupWarpStars();
  setupStars();
  frameRate(120);
}
Outline outline = new Outline();
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Star> stars = new ArrayList<Star>();
Minim minim;
boolean played = false;
Warp[] warp = new Warp[400];
float speed = 50;
void draw()
{
  //translate(width/2, height/2);
  for(int i = 0; i < warp.length; i++)
  {
    stars.get(i).drawStars();
    //warp[i].warp();
  }
  (planets.get(2)).display();
  if(!played)
  {
    (planets.get(4)).playSound();
    played = true;
  }
  outline.render();
  //noLoop();
}

void initialisePlanets()
{
  PImage vulcanImg = loadImage("Vulcan3.png");
  AudioPlayer vulcanGreeting = minim.loadFile("spock07.mp3");
  PImage kronosImg = loadImage("kronos2.png");
  AudioPlayer klingon = minim.loadFile("identify.wav");
  PImage romulusImg = loadImage("romulus2.png");
  AudioPlayer romulan = minim.loadFile("Romulan.mp3");
  PImage earthImg = loadImage("earth2.png");
  AudioPlayer english = minim.loadFile("earthFunny.mp3");
  PImage stationImg = loadImage("spaceStation2.png");
  AudioPlayer stationAudio = minim.loadFile("DS9AmbientSounds.mp3");
  Planet vulcan = new Planet(vulcanImg, vulcanGreeting);
  Planet kronos = new Planet(kronosImg, klingon);
  Planet romulus = new Planet(romulusImg, romulan);
  Planet earth = new Planet(earthImg, english);
  Planet station = new Planet(stationImg, stationAudio);
  planets.add(vulcan);
  planets.add(kronos);
  planets.add(romulus);
  planets.add(earth);
  planets.add(station);
}

void setupWarpStars()
{
  for(int i = 0; i < warp.length; i++)
  {
    warp[i] = new Warp(speed);
  }
}

void setupStars()
{
  for(int i = 0; i < 400; i++)
  {
    stars.add(new TwinklingStars());
  }
}

void displayStars()
{
  
}

//void mousePressed()
//{
//  warp.warp();
//}