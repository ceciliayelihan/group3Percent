Sprite girl;
PImage[]animation;
int imgCt = 12;
void setup(){
  frameRate(10);
  size(800,700);
  animation = new PImage[12];
  for (int i =0; i<12;i++){
    String imgName = "girl"+nf(i,3)+".png";
    PImage girl = loadImage(imgName);
    animation[i]=girl;
    }

  girl = new Sprite(animation,400,400,3);
}
void draw(){
  background(250);
  girl.display();
  girl.move();
  
}