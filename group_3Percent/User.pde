class User{
  int points, health, time, t, level;
  String name;
  PImage heart;
  
  User(String name, PImage heart, int t, int level) {
    this.name = name;
    this.points = 0;
    this.health = 5;
    this.time = 0;
    this.heart = heart;
    this.t = t;
    this.level = level;
  }
  
  void countTime() {
    this.time = millis()/1000-t;
  }
  
  void displayTime() {
    fill(255);
    textSize(40);
    text(this.time,700,50);
  }
  
  void displayHealth() {
    heart.resize(50,50);
    for (int i=0; i<this.health; i++) {
      image(heart,40+i*60,40);
    }
  }
  
  void decreaseHealth() {
    this.health -= 1;
  }
  
  void lvlup() {
    this.level += 1;
  }
  
  void countPoints() {
    this.points = 1000*this.level - this.time + 100*this.health;
  }
  
  void reset() {
    this.points = 0;
    this.health = 3;
    this.time = 0;
  }
}
