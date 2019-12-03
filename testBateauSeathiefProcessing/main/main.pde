
PImage bg;
PImage bateau;
float speed = 0.5;
PVector posBoat;
int counter = 0;
float lastAngle = -1;
PVector directionVector = new PVector(1, 0);
long lastTime = millis();
Boat boat;
Wind wind;
void setup() {
  bg = loadImage("background.png");  
  posBoat = new PVector(0,0);
  size(1400, 1200);
  boat = new Boat();
  wind = new Wind();
}
void draw(){
  keyPressed();
  background(255);
  
  
  boat.move();
  boat.draw();  
  wind.draw();
  
}
void keyPressed() {
  if (millis() - lastTime > 200 && keyPressed){
      lastTime = millis();
      if (key == CODED) {
        if (keyCode == UP) {
          directionVector = new PVector(0, -1);
        } 
        else if (keyCode == DOWN) {
          directionVector = new PVector(0, 1);
        } 
        else if (keyCode == RIGHT) {
          directionVector = new PVector(1, 0);
        }
        else if (keyCode == LEFT) {
          directionVector = new PVector(-1, 0);
        }
        float x = (directionVector.x + boat.direction.x)/1;
        float y = (directionVector.y + boat.direction.y)/1;
        println("x= ", x, " y= ", y);
        boat.direction = new PVector(x,y);
    }
    else {
      if (key == ENTER) {
        boat.sail = !boat.sail;
      }
      else if (key == BACKSPACE) {
        wind.nextDirection();
      }
    }
  }
  
}
