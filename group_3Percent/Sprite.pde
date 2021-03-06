class Sprite{
  PImage[]animation;// array for holding images for differenct movement
  int frame,imgCt; //imgCt is number of image per movement
  float x,y;
  boolean up = false;
  boolean down = true;
  boolean left = false;
  boolean right = false;
  public Sprite(PImage[] animation, float x,float y,int imgCt){
    this.animation = animation;
    this.x=x;
    this.y=y;
    this.imgCt = imgCt;
  }
  void move(){
    if (keyPressed == true){
      if (key == CODED){
        if (keyCode == UP){
          this.y = this.y -46;
          this.up = true;
          this.down = false;
          this.left = false;
          this.right = false;
      }
         if (keyCode == DOWN){
          this.y = this.y + 46;
          this.up = false;
          this.down = true;
          this.left = false;
          this.right = false;
      }
         if (keyCode == LEFT){
          this.x = this.x -40;
          this.up = false;
          this.down = false;
          this.left = true;
          this.right = false;
      }
        if (keyCode == RIGHT){
          this.x = this.x +40;
          this.up = false;
          this.down = false;
          this.left = false;
          this.right = true;
      }
     }
    }
    if ((this.x<0)||(this.x>800)||(this.y>700)){
      this.x = 400;
      this.y = 654;
    }
  }
  void getFrame(){ // down,left,right,up
    if (this.up ==true){
      this.frame = ((frameCount-1) % imgCt)+imgCt*1;
    }
    else if (this.left ==true){
      this.frame = ((frameCount-1) % imgCt)+imgCt*3;
    }
    else if (this.right ==true){
      this.frame = ((frameCount-1) % imgCt)+imgCt*2;
    }
    else{
      this.frame = ((frameCount-1) % imgCt);
    }
  }
  void display(){
    getFrame();
    imageMode(CENTER);
    image(animation[frame],this.x,this.y,50,50);
    
  }
 }