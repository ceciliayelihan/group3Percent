import processing.sound.*;
Sprite girl;
Sprite boy;
Boat b0,b1,b2,b3,b4;
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
Boolean on = false;
Boolean set=true;
int lvl,t1;

//textField
String userName = "";

//sound and GUI
PImage sound, mute, play, pause;
PImage level1background;
Boolean mutePressed=false;
Boolean pausePressed=false;
SoundFile backgroundmusic;
SoundFile levelup;

//create User instance
User user;
//crab
CrabLegs crab;
// Car
PImage car_right;
// car facing right
// Car
PImage car_right;
// car facing right
Car car1;//blue car
Car car3;
//car facing left
Car car2;//red car
Car car4;

void setup(){
crab = new CrabLegs(750,1000,10,3.3,-0.1,0);
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

  girl = new Sprite(animation_girl,400,654,3);
  boy = new Sprite(animation_boy,400,654,3);
  //sound and gui
  backgroundmusic = new SoundFile(this,"gamemusic.mp3");
  backgroundmusic.play();
  //car facing right
  PImage car_right = loadImage("blue_car.png");
  car1 = new Car(car_right,0,520,5,-200,70); 
  car3 = new Car(car_right,-2000,520,5,-200,70);

  PImage car_left = loadImage("red_car.png");
  car2 = new Car(car_left,800,580,-5,200,70); 
  car4 = new Car(car_left,1940,580,-5,200,70);

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
    PImage go =loadImage("savebegin.png");
    image(go,200,600,400,40);
    start_btn = true;
  }
  
  if (go_btn == false&&start_btn == true && mouseX>150&&mouseX<(150+200)&&mouseY<(200+200)&&mouseY>200 && mousePressed== true){//choose girl
     girltf=true; 
    }
    
   if (go_btn == false&&start_btn == true&&mouseX>450&&mouseX<(450+150)&&mouseY<(245+150)&&mouseY>245&& mousePressed== true){//choose boy
      girltf=false;
   }
   
   if (start_btn==true && go_btn ==false && girltf==true) {
     noFill();
     stroke(0);
     strokeWeight(5);
     rect(150,200,200,200);
     stroke(200);
     rect(450,200,200,200);
   } 
   if (start_btn==true && go_btn ==false && girltf==false) {
     noFill();
      stroke(0);
      strokeWeight(5);
      rect(450,200,200,200);
      stroke(200);
      rect(150,200,200,200);
   }
     
     //text name
   if (go_btn == false && start_btn ==true) {
     if (keyPressed && (key >= 'A' && key <= 'z') || key == ' ') {
       textSize(30);
       userName = userName + key;
       text(userName,320,530);
     }
   }
   
   if (go_btn == false&&start_btn ==true&&mouseX>200&&mouseX<600 && mouseY>600 &&mouseY<640 && mousePressed== true){ // press go button
      move = true;
      go_btn =true;
      //lvl 1 & start time
      lvl = 1;
      t1 = millis()/1000;
      //create user
      user=new User(userName,life,t1,lvl);
     }
 //System.out.println(move);
 if (scoreboard_btn ==false&&start_btn==false&&mouseX>325&&mouseX<(325+150)&&mouseY<(475+60)&&mouseY>475){//press score table in start
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
         //life =loadImage("life.png");
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
    if (user.level==1 && set==true){
  PImage boat = loadImage("boat.png");
  PImage leaf = loadImage("leaf.png");
  b0 = new Boat(0,56,-5,leaf,120,46);
  b1 = new Boat(0,102,5,boat,120,46);
  b2 = new Boat(800,148,-5,leaf,120,46);
  b3 = new Boat(0,194,5,boat,120,46);
  b4 = new Boat(800,240,-5,leaf,120,46);
  set=false;}
  if (user.level==2 && set==true){
  PImage boat = loadImage("boat.png");
  PImage leaf = loadImage("leaf.png");
  b0 = new Boat(0,56,-10,leaf,120,46);
  b1 = new Boat(0,102,10,boat,120,46);
  b2 = new Boat(800,148,-10,leaf,120,46);
  b3 = new Boat(0,194,10,boat,120,46);
  b4 = new Boat(800,240,-10,leaf,120,46);
  set=false;}
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
    
    PImage level1 = loadImage("level1.png");
    level1.resize(230,60);
    image(level1, 520, 630);
    b0.display();
    b0.move();
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
      if (girl.y==b0.y||girl.y==b2.y|| girl.y==b4.y){
        on=false;
        for(int i = 0; i < 5; i++){
          if ((girl.x>(b2.x+i*200-60) && girl.x<(b2.x+i*200+60)) || (girl.x>(b2.x+i*200-800-60) && girl.x<(b2.x+i*200+60-800))){
            on = true;
          }
        }
        if (on==true){
          /*Add score*/
           girl.x+=b2.speed;}
        if (on==false){
          user.decreaseHealth();
          girl.x=400;
          girl.y=286;}
      }
      //car interaction
      if ((car1UpInteractGirl() == true) || (car2UpInteractGirl() == true) || (car3UpInteractGirl() == true) || (car4UpInteractGirl() == true)||(car1DownInteractGirl() == true) || (car2DownInteractGirl() == true) || (car3DownInteractGirl() == true) || (car4DownInteractGirl() == true)){
        System.out.println("hit");
        girl.x = 400;
        girl.y = 640; 
        user.health -=1;
      }
    }
      if (girl.y==b1.y||girl.y==b3.y){
        on=false;
        for(int i = 0; i < 5; i++){
          if ((girl.x>(b1.x+i*200-60) && girl.x<(b1.x+i*200+60)) || (girl.x>(b1.x+i*200-800-60) && girl.x<(b1.x+i*200+60-800))){
            on = true;
          }
        }
        if (on==true){
          /*Add score*/
           girl.x+=b1.speed;}
        if (on==false){
          user.decreaseHealth();
          girl.x=400;
          girl.y=286;}
      }
      if (girl.y==b0.y-46){
        levelup = new SoundFile(this,"levelup.mp3");
        levelup.play();
        user.lvlup();
        set=true;
        girl.x=400;
        girl.y=654;
      }
    }
    if(girltf ==false){
      boy.display();
      boy.move();
      if (boy.y==b0.y||boy.y==b2.y|| boy.y==b4.y){
        on=false;
        for(int i = 0; i < 5; i++){
          if ((boy.x>(b2.x+i*200-60) &&boy.x<(b2.x+i*200+60)) || (boy.x>(b2.x+i*200-800-60) && boy.x<(b2.x+i*200+60-800))){
            on = true;
          }
        }
        if (on==true){
          /*Add score*/
           boy.x+=b2.speed;}
        if (on==false){
          user.decreaseHealth();
          boy.x=400;
          boy.y=286;}
      }
      if (boy.y==b1.y||boy.y==b3.y){
        on=false;
        for(int i = 0; i < 5; i++){
          if ((boy.x>(b1.x+i*200-60) && boy.x<(b1.x+i*200+60)) || (boy.x>(b1.x+i*200-800-60) && boy.x<(b1.x+i*200+60-800))){
            on = true;
          }
        }
        if (on==true){
          /*Add score*/
           boy.x+=b1.speed;}
        if (on==false){
          user.decreaseHealth();
          boy.x=400;
          boy.y=286;}
      }
      if (boy.y==b0.y-46){
        user.lvlup();
        set=true;
        boy.x=400;
        boy.y=654;
      }
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
  //display cars
  car1.display();
  car1.move();
  car3.display();
  car3.move();
  car2.display();
  car2.move();
  car4.display();
  car4.move();

  //crab
  if (user.level==2){
  crab.display();
  crab.move();
  crab.legsMove();
  }
 }
}
Boolean car1UpInteractGirl(){
  //for girl
  //for car1
  if (((car1.x0+20<girl.x-10) ||(car1.y0-120+20<girl.y-10)||(car1.x0-20>girl.x+10)||(car1.y0-120-20>girl.y+10))  
  && ((car1.x0-200+20<girl.x-10) || (car1.y0-120+20<girl.y-10) || (car1.x0-200-20>girl.x+10) ||(car1.y0-120-20>girl.y+10))
  &&((car1.x0-400+20<girl.x-10)  || (car1.y0-120+20<girl.y-10) ||(car1.x0-400-20>girl.x+10) ||(car1.y0-120-20>girl.y+10))
  &&((car1.x0-800+20<girl.x-10) || (car1.y0-120+20<girl.y-10)  ||(car1.x0-800-20>girl.x+10) ||(car1.y0-120-20>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car2UpInteractGirl(){
  //for girl
  //for car1
  if (((car2.x0+25<girl.x-10) ||(car2.y0-120+25<girl.y-10)||(car2.x0-25>girl.x+10)||(car2.y0-120-25>girl.y+10))  
  && ((car2.x0-200+25<girl.x-10) || (car2.y0-120+25<girl.y-10) || (car2.x0-200-25>girl.x+10) ||(car2.y0-120-25>girl.y+10))
  &&((car2.x0-400+25<girl.x-10)  || (car2.y0-120+25<girl.y-10) ||(car2.x0-400-25>girl.x+10) ||(car2.y0-120-25>girl.y+10) )
  &&((car2.x0-800+25<girl.x-10) || (car2.y0-120+25<girl.y-10) ||(car2.x0-800-25>girl.x+10) ||(car2.y0-120-25>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}

Boolean car3UpInteractGirl(){
  //for girl
  //for car1
  if (((car3.x0+20<girl.x-10) ||(car3.y0-120+20<girl.y-10)||(car3.x0-20>girl.x+10)||(car3.y0-120-20>girl.y+10))  
  && ((car3.x0-200+20<girl.x-10) || (car3.y0-120+20<girl.y-10)  || (car3.x0-200-20>girl.x+10) ||(car3.y0-120-20>girl.y+10))
  &&((car3.x0-400+20<girl.x-10)  || (car3.y0-120+20<girl.y-10) ||(car3.x0-400-20>girl.x+10) ||(car3.y0-120-20>girl.y+10))
  &&((car3.x0-800+20<girl.x-10) || (car3.y0-120+20<girl.y-10) ||(car3.x0-800-20>girl.x+10) ||(car3.y0-120-20>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car4UpInteractGirl(){
  //for girl
  //for car1
  if (((car4.x0+25<girl.x-10) ||(car4.y0-120+25<girl.y-10)||(car4.x0-25>girl.x+10)||(car4.y0-120-25>girl.y+10))  
  && ((car4.x0-200+25<girl.x-10) || (car4.y0-120+25<girl.y-10) || (car4.x0-200-25>girl.x+10) ||(car4.y0-120-25>girl.y+10))
  &&((car4.x0-400+25<girl.x-10)  || (car4.y0-120+25<girl.y-10) ||(car4.x0-400-25>girl.x+10) ||(car4.y0-120-25>girl.y+10))
  &&((car4.x0-800+25<girl.x-10) || (car4.y0-120+25<girl.y-10) ||(car4.x0-800-25>girl.x+10) ||(car4.y0-120-25>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}

Boolean car1DownInteractGirl(){
  //for girl
  //for car1
  if (((car1.x0+20<girl.x-10) ||(car1.y0+20<girl.y-10)||(car1.x0-20>girl.x+10)||(car1.y0-20>girl.y+10))  
  && ((car1.x0-200+20<girl.x-10) || (car1.y0+20<girl.y-10) || (car1.x0-200-20>girl.x+10) ||(car1.y0-20>girl.y+10))
  &&((car1.x0-400+20<girl.x-10)  || (car1.y0+20<girl.y-10) ||(car1.x0-400-20>girl.x+10) ||(car1.y0-20>girl.y+10))
  &&((car1.x0-800+20<girl.x-10) || (car1.y0+20<girl.y-10)  ||(car1.x0-800-20>girl.x+10) ||(car1.y0-20>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car2DownInteractGirl(){
  //for girl
  //for car1
  if (((car2.x0+25<girl.x-10) ||(car2.y0+25<girl.y-10)||(car2.x0-25>girl.x+10)||(car2.y0-25>girl.y+10))  
  && ((car2.x0-200+25<girl.x-10) || (car2.y0+25<girl.y-10) || (car2.x0-200-25>girl.x+10) ||(car2.y0-25>girl.y+10))
  &&((car2.x0-400+25<girl.x-10)  || (car2.y0+25<girl.y-10) ||(car2.x0-400-25>girl.x+10) ||(car2.y0-25>girl.y+10) )
  &&((car2.x0-800+25<girl.x-10) || (car2.y0+25<girl.y-10) ||(car2.x0-800-25>girl.x+10) ||(car2.y0-25>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}

Boolean car3DownInteractGirl(){
  //for girl
  //for car1
  if (((car3.x0+20<girl.x-10) ||(car3.y0+20<girl.y-10)||(car3.x0-20>girl.x+10)||(car3.y0-20>girl.y+10))  
  && ((car3.x0-200+20<girl.x-10) || (car3.y0+20<girl.y-10)  || (car3.x0-200-20>girl.x+10) ||(car3.y0-20>girl.y+10))
  &&((car3.x0-400+20<girl.x-10)  || (car3.y0+20<girl.y-10) ||(car3.x0-400-20>girl.x+10) ||(car3.y0-20>girl.y+10))
  &&((car3.x0-800+20<girl.x-10) || (car3.y0+20<girl.y-10) ||(car3.x0-800-20>girl.x+10) ||(car3.y0-20>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car4DownInteractGirl(){
  //for girl
  //for car1
  if (((car4.x0+25<girl.x-10) ||(car4.y0+25<girl.y-10)||(car4.x0-25>girl.x+10)||(car4.y0-25>girl.y+10))  
  && ((car4.x0-200+25<girl.x-10) || (car4.y0+25<girl.y-10) || (car4.x0-200-25>girl.x+10) ||(car4.y0-25>girl.y+10))
  &&((car4.x0-400+25<girl.x-10)  || (car4.y0+25<girl.y-10) ||(car4.x0-400-25>girl.x+10) ||(car4.y0-25>girl.y+10))
  &&((car4.x0-800+25<girl.x-10) || (car4.y0+25<girl.y-10) ||(car4.x0-800-25>girl.x+10) ||(car4.y0-25>girl.y+10))){
    return false;
  }
  else{
    return true;
  }
}

