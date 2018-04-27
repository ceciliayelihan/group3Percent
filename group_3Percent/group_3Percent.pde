import processing.sound.*;
Sprite girl;
Sprite boy;
PImage[]animation_girl;
PImage[]animation_boy;
int imgCt = 12;
Boolean move =false;
Boolean girltf=true;
PImage boy_choose;
PImage girl_choose;
PImage name;
PImage choose;


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
  animation_girl = new PImage[12];
  animation_boy = new PImage[12];
  for (int i =0; i<12;i++){
    String imgName = "girl"+nf(i,3)+".png";
    PImage girl = loadImage(imgName);
    animation_girl[i]=girl;
    }
   for (int i =0; i<12;i++){
    String imgName = "boy"+nf(i,3)+".png";
    PImage boy = loadImage(imgName);
    animation_boy[i]=boy;
    }

  girl = new Sprite(animation_girl,400,680,3);
  boy = new Sprite(animation_boy,400,680,3);
  //sound and gui
  backgroundmusic = new SoundFile(this,"gamemusic.mp3");
  backgroundmusic.play();
}
void draw(){
  if (mouseX>325&&mouseX<(325+150)&&mouseY<(370+60)&&mouseY>370){
        if (mousePressed == true) {
          //move=true;
          PImage road =loadImage("road.png");
          image(road,0,0,800,700);
          PImage girl_choose =loadImage("girl.png");
          PImage boy_choose =loadImage("boy.png");
          image(girl_choose,150,200,200,200);
          image(boy_choose,450,245,150,150);
          PImage choose =loadImage("choose.png");
          image(choose,100,100,600,100);
          PImage name =loadImage("name.png");
          image(name,320,425,150,50);
          System.out.println(mouseX);
          if (mouseX>150&&mouseX<(150+200)&&mouseY<(200+200)&&mouseY>200){ //<>//
            if (mousePressed == true) {
              noFill();
              stroke(0);
              strokeWeight(5);
              rect(150,200,200,200);
              girltf=true;
   
            }
          }
        if (mouseX>450&&mouseX<(450+150)&&mouseY<(245+150)&&mouseY>245){
            if (mousePressed == true) {
              noFill();
              stroke(0);
              strokeWeight(5);
              rect(450,200,200,200);
              girltf=false;
            }
        }
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
  
    //music and background level one
    level1background = loadImage("lvl1background.png");
    imageMode(CORNER);
    image(level1background,0,0,800,700);
    if(girltf ==true){
      girl.display();
      girl.move();
    }
    if(girltf ==false){
      boy.display();
      boy.move();
    }

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