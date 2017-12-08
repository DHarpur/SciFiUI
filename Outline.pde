class Outline
{
  float x, y;
  color c1, c2;
  Outline()
  {
    this.x = width/4;
    this.y = height/3;
    c1 = color(19, 103, 110);
    c2 = color(4, 42, 59);
  }
  
  void render(){
    translate(0, 0);
    pushMatrix();
    beginShape();
    noFill();
    stroke(c1);
    strokeWeight(5);
    vertex( x, y);
    vertex((width-(width/15)), y);
    vertex((width-(width/100)), y + height/6);
    vertex((width-(width/100)), height - height/25);
    vertex(x +(width/15), height - height/25);
    vertex(x, y + (height - (height/4)));
    vertex(x,y);
    endShape();
    popMatrix();
  }
}