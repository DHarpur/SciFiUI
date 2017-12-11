class Warp
{
  color rectColor;
  float x, y, z;
  float pz;
  float speed;
  boolean warping = false;
  Warp(float speed)
  {
    x = random(0, width);
    y = random(0, height);
    z = 1;
    pz = z;
    this.speed = speed;
    rectColor = color(19, 103, 110);
  }
  
  void drawStar()
  {
    pushMatrix();
    stroke(rectColor);
    strokeWeight(5);
    strokeWeight(1);
    fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float r = map(z, 0, width/2, 16, 0);
    if(!warping)
    {
      ellipse(sx, sy, r, r);
    }
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    pz = z;
    stroke(255);
    line(px, py, sx, sy);
    popMatrix();
  }
  
  void warp()
  {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
    warping = true;
  }
  
  void endWarp()
  {
    
  }
}