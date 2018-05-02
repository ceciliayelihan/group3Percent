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
    for (int i =0; i<5; i++){
      image(car,x0+i*this.distance,this.y0,size,size);
      image(car,x0+i*this.distance,this.y0-120,size,size);
    }

  }
  void move(){
    if (x0-1000>800){
      this.x0 = 0;
    }
    if (x0+1000<0){
      this.x0 =800;
    }
    else{
      this.x0+=speed;
    }
  }

}
