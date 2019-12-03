class Boat {
  float mass;
  int maxSpeed;
  PVector direction;
  PVector speed;
  PVector position;
  boolean sail;
  private float coeff = 0.1;
  PImage bateau;
  
   
  Boat () {
   direction = new PVector(1,0);
   speed = new PVector(0,0);
   position = new PVector(0,0);
   mass = 500;
   maxSpeed = 2;
   sail = true;
   bateau = loadImage("bateau.png");
   
  }
  void draw() {    
    translate(bateau.width + position.x, bateau.height + position.y);
    rotate(getAngle());
    image(bateau, 0, 0);
    rotate(-getAngle());
    translate(-(bateau.width + position.x), -(bateau.height + position.y));
  }
  float getAngle(){
    return (atan2(direction.y, direction.x));
  }
  void move()
  {
    PVector windSpeed = getWindSpeed();
    speed.add(windSpeed);
    speed = new PVector(abs(speed.x) <= maxSpeed ? speed.x: sign(speed.x)*maxSpeed , 
       abs(speed.y) <= maxSpeed ? speed.y: sign(speed.y)*maxSpeed);
    speed.mult(sail ? 1 : 0.99);
    position.add(speed);
  }
  int sign(double v){
    int s = v < 0 ? -1 : 1;
    return s;
  }
  PVector getWindSpeed(){
    PVector windSpeed = wind.getWind();
    PVector windDirection = wind.getDirection();
    
    PVector windDirectionWithBoat = new PVector(direction.x + windDirection.x, direction.y + windDirection.y);
    
    windSpeed = new PVector(sign(windSpeed.x) == sign(windDirectionWithBoat.x) ? sign(windSpeed.x)* (windSpeed.x * windDirectionWithBoat.x) : windSpeed.x * windDirectionWithBoat.x, 
      sign(windSpeed.y) == sign(windDirectionWithBoat.y) ? sign(windSpeed.y)*(windSpeed.y * windDirectionWithBoat.y) : windSpeed.y * windDirectionWithBoat.y );
    windSpeed.mult(sail ? 1 : 0);
    //windSpeed.div(mass);
    return windSpeed;
  }
}
