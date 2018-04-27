class Car{
  PImage car;
  float speed;
  float x0,y0;
  float distance;
  float size;
  public Car(PImage car, float x0,float y0,float speed,float distance,float size){
    this.car = car;
    this.x0 = x0;
    this.y0 =y0;
    this.speed = speed;
    this.distance = distance;
    this.size = size;
  }
  void display(){
    imageMode(CENTER);
    image(car,x0,y0,size,size);
    image(car,x0+this.distance,y0,size,size);
    image(car,x0+this.distance*2,y0,size,size);
    image(car,x0+this.distance*3,y0,size,size);
    image(car,x0+this.distance*4,y0,size,size);
  }
  void move(){
    this.x0+=speed;
  }
}