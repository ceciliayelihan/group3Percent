import processing.sound.*;
Sprite girl;
PImage[]animation;
int imgCt = 12;
Boolean move =false;

//sound and GUI
PImage sound;
PImage mute;
PImage play;
PImage pause;
PImage level1background;
Boolean mutePressed=false;
Boolean pausePressed=false;
SoundFile backgroundmusic;
void setup(){
  PImage life =loadImage("life.png");
  PImage start =loadImage("start.png");
  PImage score =loadImage("score.png");
  PImage girlt =loadImage("girl002.png");
  PImage title =loadImage("title.png");
  PImage road =loadImage("road.png");
  image(road,0,0,800,700);
  image(life,50,50,50,50);
  image(life,110,50,50,50);
  image(life,170,50,50,50);
  image(title,180,200,450,90);
  image(start,325,370,150,60);
  image(score,325,475,150,60);
  image(girlt,255,370,60,60);
  frameRate(10);
  size(800,700);
  animation = new PImage[12];
  for (int i =0; i<12;i++){
    String imgName = "girl"+nf(i,3)+".png";
    PImage girl = loadImage(imgName);
    animation[i]=girl;
    }

  girl = new Sprite(animation,400,680,3);
  //sound and gui
  backgroundmusic = new SoundFile(this,"gamemusic.mp3");
  backgroundmusic.play();
}
void draw(){
  if (mouseX>325&&mouseX<(325+150)&&mouseY<(370+60)&&mouseY>370){
        if (mousePressed == true) {
          move=true;
        }
  }
  if (mouseX>325&&mouseX<(325+150)&&mouseY<(475+60)&&mouseY>475){
        if (mousePressed == true) {
          fill(255);
          rect(0,0,800,700);
          PImage scoreboard =loadImage("scoretable.png");
          image(scoreboard,280,80,280,112);
        }
  }
  if (move==true){
    sound = loadImage("sound.png");
  mute = loadImage("mute.png");
  play = loadImage("play.png");
  pause = loadImage("pause.png");
  
  sound.resize(57,57);
  mute.resize(57,57);
  play.resize(50,50);
  pause.resize(51,51);
  
  
  level1background = loadImage("lvl1background.png");
    imageMode(CORNER);
    image(level1background,0,0,800,700);
    girl.display();
    girl.move();
    if (pausePressed == false) {
    image(pause,35,665);
  } else {
    image(play,35,665);
  }
  if (mutePressed == false) {
    image(mute,95,665);
  } else {
    image(sound,95,665);
  }
  if (dist(mouseX,mouseY,35,665)<30 && mousePressed ==true && pausePressed==false) {
    pausePressed=true;
  } else if (dist(mouseX,mouseY,35,665)<30 && mousePressed ==true && pausePressed==true) {
    pausePressed=false;
  }
  if (dist(mouseX,mouseY,95,665)<30 && mousePressed ==true && mutePressed==false) {
    mutePressed=true;
    backgroundmusic.stop();
  } else if (dist(mouseX,mouseY,95,665)<30 && mousePressed ==true && mutePressed==true) {
    mutePressed=false;
    backgroundmusic.play();
  }
  }

  
  
}