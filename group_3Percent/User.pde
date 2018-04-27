PImage life =loadImage("life.png");

class User{
  int points, health, time;
  String name;
  
  User(String name) {
    this.name = name;
    this.points = 0;
    this.health = 3;
    this.time = 0;
  }
  
  void countTime() {
    this.time += millis()/1000;
  }
  
  void displayTime() {
    textSize(30);
    text(this.time,750,20);
  }
  
  void displayHealth() {
    for (int i=0; i<this.health; i++) {
      image(life,10+i*60,10);
    }
  }
  
  void decreaseHealth() {
    this.health -=1;
  }
  
  void countPoints() {
    //this.points = ;
  }
  
  void reset() {
    this.points = 0;
    this.health = 3;
    this.time = 0;
  }
}
