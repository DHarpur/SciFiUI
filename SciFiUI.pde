import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Outline outline = new Outline();
ArrayList<Planet> planets = new ArrayList<Planet>();
Menu menu = new Menu();
Warp[] warp = new Warp[400];
Minim minim;

void setup()
{
  minim = new Minim(this);
  fullScreen();
  background(0);
  smooth();
  initialisePlanets();
  setupWarpStars();
  //setupStars();
  frameRate(120);
}


boolean played = false;
boolean warped = false;
int planetNumber = 4;
float speed = 50;
int state = 1;
float screenWidth = displayWidth;
float screenHeight = displayHeight;

void draw()
{
  //translate(width/2, height/2);
  if(!warped)
  {
    displayStars();
    (planets.get(planetNumber)).display();
    if(!played)
    {
      (planets.get(planetNumber)).playSound();
      played = true;
    }
    if(state == 1)
    {
      menu.displayMenu();
    }
    else if(state == 2)
    {
      menu.confirm();
      state = 0;
    }
  }
  else
  {
    if(state == 1)
    {
      menu.displayMenu();
    }
    else if(state == 2)
    {
      menu.confirm();
      state = 0;
    }
  }
  outline.render();
}

void initialisePlanets()
{
  PImage vulcanImg = loadImage("Final_Images/Vulcan3.png");
  AudioPlayer vulcanGreeting = minim.loadFile("Sound/spock07.mp3");
  PImage kronosImg = loadImage("Final_Images/kronos2.png");
  AudioPlayer klingon = minim.loadFile("Sound/identify.wav");
  PImage romulusImg = loadImage("Final_Images/romulus2.png");
  AudioPlayer romulan = minim.loadFile("Sound/Romulan.mp3");
  PImage earthImg = loadImage("Final_Images/earth2.png");
  AudioPlayer english = minim.loadFile("Sound/earthFunny.mp3");
  PImage stationImg = loadImage("Final_Images/spaceStation2.png");
  AudioPlayer stationAudio = minim.loadFile("Sound/DS9AmbientSounds.mp3");
  Planet vulcan = new Planet(vulcanImg, vulcanGreeting, "Vulcan");
  Planet kronos = new Planet(kronosImg, klingon, "Kronos");
  Planet romulus = new Planet(romulusImg, romulan, "Romulus");
  Planet earth = new Planet(earthImg, english, "Earth");
  Planet station = new Planet(stationImg, stationAudio, "Deep Space Nine");
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

void displayStars()
{
  color rectColor = color(19, 103, 110);
  fill(0, 10);
  stroke(rectColor);
  rect(1, 1, width-1, height-1);
  fill(255);
  noStroke();
  ellipse(random(0, width), random(0, height), 3, 3); 
}

void keyPressed()
{
    if(key == 'w')
    {
      state = 1;
    }
}