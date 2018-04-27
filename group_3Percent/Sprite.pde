class Sprite{
  PImage[] animation;//  array for holding images for differenct movement
  int frame,imgCt; 
  float x,y;
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  public Sprite(PImage[] animation, float x,float y,int imgCt){
    this.animation = animation;
    this.x=x;
    this.y=y;
    this.imgCt = imgCt;
  }
  void move(){
    if (key ==CODED){
      if (key == UP){
        this.y = this.y -20;
        this.up = true;
        this.down = false;
        this.left = false;
        this.right = false;
      }
      else if (key == DOWN){
        this.y = this.y +20;
        this.up = false;
        this.down = true;
        this.left = false;
        this.right = false;
      }
      else if (key == LEFT){
        this.x = this.x -20;
        this.up = false;
        this.down = false;
        this.left = true;
        this.right = false;
    }
    else if (key == RIGHT){
        this.x = this.x +20;
        this.up = false;
        this.down = false;
        this.left = false;
        this.right = true;
    }
   }
  }
  void getFrame(){ //origin, down,left,right
    if (this.down ==true){
      this.frame = (frameCount-1)%3;
    }
    else if (this.left ==true){
      this.frame = (frameCount-1)%3+3;
    }
    else if (this.right ==true){
      this.frame = (frameCount-1)%3+6;
    }
    else{
      this.frame =(frameCount-1)%3+9;
    }
  }
  void display(){
    getFrame();
    imageMode(CENTER);
    image(animation[frame],this.x,this.y,50,50);
  }
 }