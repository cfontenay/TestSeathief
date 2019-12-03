class Wind {
  PImage arrow;
  PVector direction;
  float force;
  float[] trigoValues = {0, PI/6, PI/4, PI/3, PI/2, (2*PI)/3, (3*PI)/4, (5*PI)/6, PI, (7*PI)/6, (5*PI)/4, (4*PI)/3, (3*PI)/2, (5*PI)/3, (7*PI)/4, (11*PI)/6};
  int indexAngle = 0;
  Wind() {
    force = 1;
    direction = new PVector(1,0);
    arrow = loadImage("arrow.png");
  }
  void draw() {
    translate(width/2, height/2);
    rotate(-getAngle());
    image(arrow, -arrow.width/2, -arrow.height/2);
    translate(-width/2, -height/2);
  }
  void nextDirection() {
    indexAngle ++;    
  }
  float getAngle() {
    return trigoValues[indexAngle%trigoValues.length];
  }
  PVector getWind() {
    PVector a = getDirection();
    a.mult(force);
    return a;
  }
  PVector getDirection() {
    return new PVector(cos(getAngle()), -sin(getAngle()));
  }
  
}
