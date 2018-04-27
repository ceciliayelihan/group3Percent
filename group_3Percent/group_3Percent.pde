import processing.sound.*;
Sprite girl;
Sprite boy;
Boat b1,b2,b3,b4;
PImage[]animation_girl;
PImage[]animation_boy;
PImage[]animation;
PImage boy_choose;
PImage girl_choose;
PImage name;
PImage choose;
int imgCt = 12;
Boolean move =false;//level one move?
Boolean girltf=true;//choose character in the beginning 
Boolean start_btn = false; //start or scoreboard in main screen
Boolean scoreboard_btn = false;//start or scoreboard in main screen
Boolean go_btn = false;
int lvl,t1;

//textField
String userName = "";

//sound and GUI
PImage sound, mute, play, pause;
PImage level1background;
Boolean mutePressed=false;
Boolean pausePressed=false;
SoundFile backgroundmusic;

//create User instance
User user;

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
  PImage boat = loadImage("boat.png");
  PImage leaf = loadImage("leaf.png");
  b1 = new Boat(0,50,20,boat,150,40);
  b2 = new Boat(800,105,-20,leaf,100,60);
  b3 = new Boat(50,160,20,boat,150,40);
  b4 = new Boat(750,215,-20,leaf,100,60);
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
  PImage life =loadImage("life.png");
  if (start_btn == false && mouseX>325 &&mouseX<(325+150)&&mouseY<(370+60)&&mouseY>370 && mousePressed == true){// if press start
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
    PImage go =loadImage("go.png");
    image(go,350,600,100,100);
    start_btn = true;
  }
  
  if (go_btn == false&&start_btn == true && mouseX>150&&mouseX<(150+200)&&mouseY<(200+200)&&mouseY>200 && mousePressed== true){//choose girl
     noFill();
     stroke(0);
     strokeWeight(5);
     rect(150,200,200,200);
     girltf=true; 
     
    }
    //System.out.println(start_btn);
   if (go_btn == false&&start_btn == true&&mouseX>450&&mouseX<(450+150)&&mouseY<(245+150)&&mouseY>245&& mousePressed== true){//choose boy
      noFill();
      stroke(0);
      strokeWeight(5);
      rect(450,200,200,200);
      girltf=false;
      //System.out.println(go_btn);
     }
     
     //text name
   if (go_btn == false && start_btn ==true) {
     if (keyPressed && (key >= 'A' && key <= 'z') || key == ' ') {
       textSize(30);
       text(userName,320,530);
       userName = userName + key;
     }
   }
   
   if (go_btn == false&&start_btn ==true&&mouseX>250&&mouseX<450 && mouseY>500 &&mouseY<700 && mousePressed== true){ // press go button
      move = true;
      go_btn =true;
      
      //lvl 1 & start time
      lvl = 1;
      t1 = millis()/1000;
      //create user
      user=new User(userName,life,t1,lvl);
     }
 //System.out.println(move);
 if (scoreboard_btn ==false&&mouseX>325&&mouseX<(325+150)&&mouseY<(475+60)&&mouseY>475){//press score table in start
       if (mousePressed == true) {
         fill(255);
         rect(0,0,800,700);
         PImage scoreboard =loadImage("scoretable.png");
         image(scoreboard,180,80,440,160);
         scoreboard_btn = true;
         PImage back =loadImage("back.png");
         image(back,40,40,70,30);
       }
 }
 if (scoreboard_btn ==true&&mouseX>40&&mouseX<(40+70)&&mouseY<(40+30)&&mouseY>40){//press score table in start
       if (mousePressed == true) {
         scoreboard_btn=false;
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
    b1.display();
    b1.move();
    b2.display();
    b2.move();
    b3.display();
    b3.move();
    b4.display();
    b4.move();
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
  //test user
  user.countTime();
  user.displayHealth();
  user.displayTime();
  //user.decreaseHealth();
  //user.reset();
 }
}
