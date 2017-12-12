import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Outline outline = new Outline();
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Sound> sounds = new ArrayList<Sound>();
Menu menu = new Menu();
Warp[] warp = new Warp[400];
Minim minim;

void setup()
{
  minim = new Minim(this);
  fullScreen();
  background(0);
  noCursor();
  smooth();
  initialisePlanets();
  initialiseSounds();
  setupWarpStars();
  frameRate(120);
}


boolean played = false;
boolean warped = false;
boolean changed = false;
boolean confirmed = false;
boolean backgroundSound = false;
int planetNumber = 4;
float speed = 50;
int state = 0;
float screenWidth = displayWidth;
float screenHeight = displayHeight;
int index = 0;
int indexC = 0;
int timer = 0;
int selectedPlanet;

void initialisePlanets()
{
  PImage vulcanImg = loadImage("images/Vulcan3.png");
  PImage kronosImg = loadImage("images/kronos2.png");
  PImage romulusImg = loadImage("images/romulus2.png");
  PImage earthImg = loadImage("images/earth2.png");
  PImage stationImg = loadImage("images/spaceStation2.png");
  
  Planet vulcan = new Planet(vulcanImg, "Vulcan", 0);
  Planet kronos = new Planet(kronosImg, "Kronos", 1);
  Planet romulus = new Planet(romulusImg, "Romulus", 2);
  Planet earth = new Planet(earthImg, "Earth", 3);
  Planet station = new Planet(stationImg, "Deep Space \nNine", 4);
  
  planets.add(vulcan);
  planets.add(kronos);
  planets.add(romulus);
  planets.add(earth);
  planets.add(station);
}

void initialiseSounds()
{
  Sound vulcanGreeting = new Sound("sound/spock07.mp3");
  Sound romulan = new Sound("sound/Romulan.mp3");
  Sound english = new Sound("sound/earthFunny.mp3");
  Sound stationAudio = new Sound("sound/DS9AmbientSounds.mp3");
  Sound klingon = new Sound("sound/identify.wav");
  
  sounds.add(vulcanGreeting);
  sounds.add(klingon);
  sounds.add(romulan);
  sounds.add(english);
  sounds.add(stationAudio);
}

void setupWarpStars()
{
  for(int i = 0; i < warp.length; i++)
  {
    warp[i] = new Warp(speed);
  }
}


void draw()
{
  if(!backgroundSound)
  {
    sounds.get(4).lowerVolume();
    sounds.get(4).playSound();
    backgroundSound = true;
  }
  if(!warped)
  {
    displayStars();
    (planets.get(planetNumber)).display();
    if(!played)
    {
      (sounds.get(planetNumber)).playSound();
      if((sounds.get(planetNumber).isPlaying()))
      {
        sounds.get(4).stopPlayback();
        backgroundSound = false;
      }
      played = true;
    }
    if(state == 1 && !confirmed)
    {
      menu.displayMenu();
    }
    if(confirmed)
    {
      menu.confirm();
    }
    
  }
  else
  {
    fill(0,80);
    rect(2,2, width, height);
    translate(width/2, height/2);
    played = false;
    if(timer < 200)
    {
      for(int i = 0; i < warp.length; i++)
      {
        warp[i].drawStar();
        warp[i].warp();
      }
      timer++;
    }
    else
    {
      warped = false;
      timer = 0;
      state = 0;
      confirmed = false;
      played = false;
    }
    translate(-(width/2), -(height/2));
  }
  
  outline.render();
}

void displayStars()
{
  color rectColor = color(19, 103, 110);
  fill(0, 30);
  stroke(rectColor);
  rect(1, 1, width-1, height-1);
  fill(255);
  noStroke();
  ellipse(random(0, width), random(0, height), 3, 3); 
}

void keyPressed()
{
  if(keyCode == LEFT)
  {
    if(!confirmed)
    {
      if(index == 0)
      {
        index = 3;
      }
      else
      {
        index--;
      }
    }
    else
    {
      if(indexC == 0)
      {
        indexC = 1;
      }
      else
      {
        indexC--;
      }
    }
  }
  else if(keyCode == RIGHT)
  {
    if(!confirmed)
    {
      if(index == 3)
      {
        index = 0;
      }
      else
      {
        index++;
      }
    }
    else
    {
      if(indexC == 1)
      {
        indexC = 0;
      }
      else 
      {
        indexC++;
      }
    }
  }
  else if(key == 'w')
  {
    state = 1;
  }
  else if(key == ENTER)
  {
    if(!confirmed)
    {
      confirmed = true;
    }
    else
    {
      menu.changePlanet();
      selectedPlanet = index;
    }
  }
}