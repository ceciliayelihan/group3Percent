class Boat{
  float x,y,speed,l,h;
  PImage boat;
  
  Boat(){}
  Boat(float x, float y, float speed, PImage boat,float l, float h) {
    this.x=x;
    this.y=y;
    this.speed=speed;
    this.boat=boat;
    this.l=l;
    this.h=h;
  }
 
  
  void display(){
    for(int i = 0; i < 4; i++){
        image(boat,x+i*200,y,l,h);
        image(boat,x+i*200-800,y,l,h);
    }
  }
  
  void move(){

    if (x>800){
      this.x=0;
    }
    if (x<0){
      this.x=800;
    }
    else{
      this.x+=speed;}
  }
  
}