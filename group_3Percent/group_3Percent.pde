import processing.sound.*;
Sprite girl, boy;
Boat b0,b1,b2,b3,b4;
PImage[]animation_girl, animation_boy, animation;
PImage boy_choose, girl_choose, name, choose, sound, mute, level1background;
int imgCt = 12;
Boolean move =false; /*level one move?*/
Boolean girltf=true;/*choose character in the beginning */
Boolean start_btn = false; //start or scoreboard in main screen
Boolean scoreboard_btn = false;//start or scoreboard in main screen
Boolean go_btn = false;
Boolean on = false, set=true, mutePressed=false;
Boolean defeat =false;
Boolean wins =false;
Boolean keys = false;
Boolean keya = false;
int lvl,t1;
String userName = "";
SoundFile backgroundmusic, levelup/*, car, drop*/;
User user;
CrabLegs crab;
Car car1, car3, car2, car4;

void setup() {
  crab = new CrabLegs(300,300,10,3.3,-0.1,0);
  ////start screen////////////////////////////////////////////////////////////
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
  //////call character////////////////////////////////////////////////////
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
  ///////sound/////////////////////////////////////////////////////
  backgroundmusic = new SoundFile(this,"gamemusic.mp3");
  backgroundmusic.play();
  ////////call car//////////////////////////////////////////////
  PImage car_right = loadImage("blue_car.png");
  car1 = new Car(car_right,0,520,5,-200,70); 
  car3 = new Car(car_right,-2000,520,5,-200,70);
  PImage car_left = loadImage("red_car.png");
  car2 = new Car(car_left,800,580,-5,200,70); 
  car4 = new Car(car_left,1940,580,-5,200,70);
}

void draw(){
  //car = new SoundFile(this,"car.mp3");
  //drop = new SoundFile(this,"drop.mp3");
  ////////scoreboard//////////////////////////////////
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
         PImage life =loadImage("life.png");
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
  /////choose character screen///////////////////////////////////
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
  //start choosing
  if (go_btn == false&&start_btn == true && mouseX>150&&mouseX<(150+200)&&mouseY<(200+200)&&mouseY>200 && mousePressed== true){//choose girl
     girltf=true; 
    }
   if (go_btn == false&&start_btn == true&&mouseX>450&&mouseX<(450+150)&&mouseY<(245+150)&&mouseY>245&& mousePressed== true){//choose boy
      girltf=false;
   }
   //choose rect
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
   ////////level 1 start/////////////////////////press go button
   if (go_btn == false&&start_btn ==true&&mouseX>200&&mouseX<600 && mouseY>600 &&mouseY<640 && mousePressed== true){ 
      move = true;
      go_btn =true;
      //lvl 1 & start time
      lvl = 1;
      t1 = millis()/1000;
      //create user
      PImage life =loadImage("life.png");
      user=new User(userName,life,t1,lvl);
     }
     
////////////level///////////////////////////////////////////////////////////
  if (move==true){
    //music and background level one
    level1background = loadImage("lvl1background.png");
    imageMode(CORNER);
    image(level1background,0,0,800,700);
    //load image
    PImage boat = loadImage("boat.png");
    PImage leaf = loadImage("leaf.png");
    sound = loadImage("sound.png");
    mute = loadImage("mute.png");
    sound.resize(57,57);
    mute.resize(57,57);
    PImage level1 = loadImage("level1.png");
    PImage level2 = loadImage("level2.png");
    PImage level3 = loadImage("level3.png");    
    //// pause and mute /////
    imageMode(CENTER);
    if (mutePressed == false) {
      image(mute,35,665); } else { image(sound,35,665); }
    if (dist(mouseX,mouseY,35,665)<30 && mousePressed ==true && mutePressed==false) {
      mutePressed=true;
      backgroundmusic.stop(); } else if (dist(mouseX,mouseY,35,665)<30 && mousePressed ==true && mutePressed==true) {
        mutePressed=false;
        backgroundmusic.play();
      }
  
    //level change
    if (user.level==1){
      imageMode(CORNER);
      level1.resize(230,60);
      image(level1, 520, 630);
      if (set ==true){
        b0 = new Boat(0,56,-5,leaf,120,46);
        b1 = new Boat(0,102,5,boat,120,46);
        b2 = new Boat(800,148,-5,leaf,120,46);
        b3 = new Boat(0,194,5,boat,120,46);
        b4 = new Boat(800,240,-5,leaf,120,46);
        set=false; }
    }
    if (user.level==2){
      imageMode(CORNER);
      level2.resize(230,60);
      image(level2, 520, 630);
      if (set==true){
        b0 = new Boat(0,56,-10,leaf,120,46);
        b1 = new Boat(0,102,10,boat,120,46);
        b2 = new Boat(800,148,-10,leaf,120,46);
        b3 = new Boat(0,194,10,boat,120,46);
        b4 = new Boat(800,240,-10,leaf,120,46);
        set=false; }
    }
    if (user.level==3){
      imageMode(CORNER);
      level3.resize(230,60);
      image(level3, 520, 630);
      if (set==true){
        b0 = new Boat(0,56,-15,leaf,120,46);
        b1 = new Boat(0,102,15,boat,120,46);
        b2 = new Boat(800,148,-15,leaf,120,46);
        b3 = new Boat(0,194,15,boat,120,46);
        b4 = new Boat(800,240,-15,leaf,120,46);
        keys=true;
        set=false; }
    }
    
    ///////display boat///////////
    if (keya==false&&keys==true || keys==false){
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
    }
    //////display cars//////////
    car1.display();
    car1.move();
    car3.display();
    car3.move();
    car2.display();
    car2.move();
    car4.display();
    car4.move();
    if (user.health==0){
      defeat=true;
    }
    if (user.level==4){
      wins=true;
    }
    ////////girl interection
    if(girltf ==true){
      girl.display();
      girl.move();  
      //car girl interaction
      if ((car1UpInteractGirl() == true) || (car2UpInteractGirl() == true) || (car3UpInteractGirl() == true) || (car4UpInteractGirl() == true)||(car1DownInteractGirl() == true) || (car2DownInteractGirl() == true) || (car3DownInteractGirl() == true) || (car4DownInteractGirl() == true)){
        girl.x = 400;
        if (keys==false){
          girl.y = 654; }
        if (keys==true&&keya==true){
          girl.y = 286;
        }
        //car.play();
        user.decreaseHealth();
      }
      //boat girl interect
      if (girl.y==b0.y||girl.y==b2.y|| girl.y==b4.y){
        on=false;
        for(int i = 0; i < 5; i++){
          if ((girl.x>(b2.x+i*200-60) && girl.x<(b2.x+i*200+60)) || (girl.x>(b2.x+i*200-800-60) && girl.x<(b2.x+i*200+60-800))){
            on = true;
          }
        }
        if (on==true){
           girl.x+=b2.speed;}
        if (on==false){
          //drop.play();
          user.decreaseHealth();
          girl.x=400;
          girl.y=286;}
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
          //drop.play();
          user.decreaseHealth();
          girl.x=400;
          girl.y=286;}
      }
      //level up
      if (girl.y==b0.y-46){
        levelup = new SoundFile(this,"levelup.mp3");
        levelup.play();
        user.lvlup();
        set=true;
        girl.x=400;
        girl.y=654;
      }
      if (girl.y==286&&keys==true){
        keya=true;
      } 
      if (keya==true&&keys==true){
        imageMode(CENTER);
        PImage keyi=loadImage("key.png");
        image(keyi, 200,654,30,60);}
      if (girl.y==654 &&girl.x==200&&keya==true&&keys==true){
          keys=false;
          keya=false;
        }        
    }
    //////////boy interection
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
           boy.x+=b2.speed;}
        if (on==false){
          //drop.play();
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
           boy.x+=b1.speed;}
        if (on==false){
          //drop.play();
          user.decreaseHealth();
          boy.x=400;
          boy.y=286;}
      }
      if (boy.y==b0.y-46){
        levelup = new SoundFile(this,"levelup.mp3");
        levelup.play();
        user.lvlup();
        set=true;
        boy.x=400;
        boy.y=654;
      }
     if ((car1UpInteractBoy() == true) || (car2UpInteractBoy() == true) || (car3UpInteractBoy() == true) || (car4UpInteractBoy() == true)||(car1DownInteractBoy() == true) || (car2DownInteractBoy() == true) || (car3DownInteractBoy() == true) || (car4DownInteractBoy() == true)){
        boy.x = 400;
        if (keys==false){
          boy.y = 654; }
        if (keys==true&&keya==true){
          boy.y = 286;
        }
        //car.play();
        user.decreaseHealth();
      }
      if (boy.y==286&&keys==true){
        keya=true;
      } 
      if (keya==true&&keys==true){
        imageMode(CENTER);
        PImage keyi=loadImage("key.png");
        image(keyi, 200,654,30,60);}
      if (girl.y==654 &&boy.x==200&&keya==true&&keys==true){
          keys=false;
          keya=false;
        }       
    }

  ///crab for level 2////
  if (user.level==2){
  crab.display();
  crab.move();
  crab.legsMove();
  
  if (girl.x<=crab.x+25 && girl.x>=crab.x-25 && girl.y<=crab.y+20 && girl.y>=crab.y-20) {
    user.decreaseHealth();
    girl.x=400;
    girl.y=654;
  }
  if (boy.x<=crab.x+25 && boy.x>=crab.x-25 && boy.y<=crab.y+20 && boy.y>=crab.y-20) {
    user.decreaseHealth();
    boy.x=400;
    boy.y=654;
  }
  
  }
  //test user
     imageMode(CENTER);
     user.countTime();
     user.displayHealth();
     user.displayTime();
 }
  if (defeat==true){
        fill(0);
        rect(0,0,800,700);
        move=false;
        PImage loss=loadImage("gameover.png");
        PImage restart=loadImage("restart.png");
        
        fill(255);
        user.countPoints();
        textSize(50);
        text("SCORE: "+user.points,275,150);
        
        image(loss,400,300,200,100);
        image(restart,400,500,300,100);
        ///////////display SCORE//////////////////////////
        if (mouseX>250&&mouseX<550&&mouseY>450&&mouseY<550){
          if (mousePressed==true){
            move =false; /*level one move?*/
            girltf=true;/*choose character in the beginning */
            start_btn = false; //start or scoreboard in main screen
            scoreboard_btn = false;//start or scoreboard in main screen
            go_btn = false;
            on = false;
            set=true;
            defeat =false;
            wins=false;
            imageMode(CORNER);
            PImage start =loadImage("start.png");
            PImage score =loadImage("score.png");
            PImage girlt =loadImage("girl002.png");
            PImage title =loadImage("title.png");
            PImage road =loadImage("road.png");
            PImage life =loadImage("life.png");
            image(road,0,0,800,700);
            image(life,50,50,50,50);
            image(life,110,50,50,50);
            image(life,170,50,50,50);
            image(title,180,200,450,90);
            image(start,325,370,150,60);
            image(score,325,475,150,60);
            image(girlt,255,370,60,60);
            boy.x=400;
            boy.y=654;
            girl.x=400;
            girl.y=654;
            userName=""
            }
        }
  }
  if (wins==true){
        fill(0);
        rect(0,0,800,700);
        move=false;
        fill(255);
        user.countPoints();
        textSize(50);
        text("SCORE: "+user.points,275,150);
        PImage win=loadImage("win.png");
        PImage restart=loadImage("restart.png");
        image(win,400,300,200,80);
        image(restart,400,500,300,100);
        ///////////display SCORE//////////////////////////
        if (mouseX>250&&mouseX<550&&mouseY>450&&mouseY<550){
          if (mousePressed==true){
            move =false; /*level one move?*/
            girltf=true;/*choose character in the beginning */
            start_btn = false; //start or scoreboard in main screen
            scoreboard_btn = false;//start or scoreboard in main screen
            go_btn = false;
            on = false;
            set=true;
            defeat =false;
            wins=false;
            imageMode(CORNER);
            PImage start =loadImage("start.png");
            PImage score =loadImage("score.png");
            PImage girlt =loadImage("girl002.png");
            PImage title =loadImage("title.png");
            PImage road =loadImage("road.png");
            PImage life =loadImage("life.png");
            image(road,0,0,800,700);
            image(life,50,50,50,50);
            image(life,110,50,50,50);
            image(life,170,50,50,50);
            image(title,180,200,450,90);
            image(start,325,370,150,60);
            image(score,325,475,150,60);
            image(girlt,255,370,60,60);
            userName=""
          }
        }
  }
 
}
/////////////Car Boolean///////do not enter/////////////////////
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
Boolean car1UpInteractBoy(){
  //for girl
  //for car1
  if (((car1.x0+20<boy.x-10) ||(car1.y0-120+20<boy.y-10)||(car1.x0-20>boy.x+10)||(car1.y0-120-20>boy.y+10))  
  && ((car1.x0-200+20<boy.x-10) || (car1.y0-120+20<boy.y-10) || (car1.x0-200-20>boy.x+10) ||(car1.y0-120-20>boy.y+10))
  &&((car1.x0-400+20<boy.x-10)  || (car1.y0-120+20<boy.y-10) ||(car1.x0-400-20>boy.x+10) ||(car1.y0-120-20>boy.y+10))
  &&((car1.x0-800+20<boy.x-10) || (car1.y0-120+20<boy.y-10)  ||(car1.x0-800-20>boy.x+10) ||(car1.y0-120-20>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car2UpInteractBoy(){
  //for girl
  //for car1
  if (((car2.x0+25<boy.x-10) ||(car2.y0-120+25<boy.y-10)||(car2.x0-25>boy.x+10)||(car2.y0-120-25>boy.y+10))  
  && ((car2.x0-200+25<boy.x-10) || (car2.y0-120+25<boy.y-10) || (car2.x0-200-25>boy.x+10) ||(car2.y0-120-25>boy.y+10))
  &&((car2.x0-400+25<boy.x-10)  || (car2.y0-120+25<boy.y-10) ||(car2.x0-400-25>boy.x+10) ||(car2.y0-120-25>boy.y+10) )
  &&((car2.x0-800+25<boy.x-10) || (car2.y0-120+25<boy.y-10) ||(car2.x0-800-25>boy.x+10) ||(car2.y0-120-25>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car3UpInteractBoy(){
  //for girl
  //for car1
  if (((car3.x0+20<boy.x-10) ||(car3.y0-120+20<boy.y-10)||(car3.x0-20>boy.x+10)||(car3.y0-120-20>boy.y+10))  
  && ((car3.x0-200+20<boy.x-10) || (car3.y0-120+20<boy.y-10)  || (car3.x0-200-20>boy.x+10) ||(car3.y0-120-20>boy.y+10))
  &&((car3.x0-400+20<boy.x-10)  || (car3.y0-120+20<boy.y-10) ||(car3.x0-400-20>boy.x+10) ||(car3.y0-120-20>boy.y+10))
  &&((car3.x0-800+20<boy.x-10) || (car3.y0-120+20<boy.y-10) ||(car3.x0-800-20>boy.x+10) ||(car3.y0-120-20>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car4UpInteractBoy(){
  //for girl
  //for car1
  if (((car4.x0+25<boy.x-10) ||(car4.y0-120+25<boy.y-10)||(car4.x0-25>boy.x+10)||(car4.y0-120-25>boy.y+10))  
  && ((car4.x0-200+25<boy.x-10) || (car4.y0-120+25<boy.y-10) || (car4.x0-200-25>boy.x+10) ||(car4.y0-120-25>boy.y+10))
  &&((car4.x0-400+25<boy.x-10)  || (car4.y0-120+25<boy.y-10) ||(car4.x0-400-25>boy.x+10) ||(car4.y0-120-25>boy.y+10))
  &&((car4.x0-800+25<boy.x-10) || (car4.y0-120+25<boy.y-10) ||(car4.x0-800-25>boy.x+10) ||(car4.y0-120-25>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car1DownInteractBoy(){
  //for girl
  //for car1
  if (((car1.x0+20<boy.x-10) ||(car1.y0+20<boy.y-10)||(car1.x0-20>boy.x+10)||(car1.y0-20>boy.y+10))  
  && ((car1.x0-200+20<boy.x-10) || (car1.y0+20<boy.y-10) || (car1.x0-200-20>boy.x+10) ||(car1.y0-20>boy.y+10))
  &&((car1.x0-400+20<boy.x-10)  || (car1.y0+20<boy.y-10) ||(car1.x0-400-20>boy.x+10) ||(car1.y0-20>boy.y+10))
  &&((car1.x0-800+20<boy.x-10) || (car1.y0+20<boy.y-10)  ||(car1.x0-800-20>boy.x+10) ||(car1.y0-20>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car2DownInteractBoy(){
  //for girl
  //for car1
  if (((car2.x0+25<boy.x-10) ||(car2.y0+25<boy.y-10)||(car2.x0-25>boy.x+10)||(car2.y0-25>boy.y+10))  
  && ((car2.x0-200+25<boy.x-10) || (car2.y0+25<boy.y-10) || (car2.x0-200-25>boy.x+10) ||(car2.y0-25>boy.y+10))
  &&((car2.x0-400+25<boy.x-10)  || (car2.y0+25<boy.y-10) ||(car2.x0-400-25>boy.x+10) ||(car2.y0-25>boy.y+10) )
  &&((car2.x0-800+25<boy.x-10) || (car2.y0+25<boy.y-10) ||(car2.x0-800-25>boy.x+10) ||(car2.y0-25>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car3DownInteractBoy(){
  //for girl
  //for car1
  if (((car3.x0+20<boy.x-10) ||(car3.y0+20<boy.y-10)||(car3.x0-20>boy.x+10)||(car3.y0-20>boy.y+10))  
  && ((car3.x0-200+20<boy.x-10) || (car3.y0+20<boy.y-10)  || (car3.x0-200-20>boy.x+10) ||(car3.y0-20>boy.y+10))
  &&((car3.x0-400+20<boy.x-10)  || (car3.y0+20<boy.y-10) ||(car3.x0-400-20>boy.x+10) ||(car3.y0-20>boy.y+10))
  &&((car3.x0-800+20<boy.x-10) || (car3.y0+20<boy.y-10) ||(car3.x0-800-20>boy.x+10) ||(car3.y0-20>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
Boolean car4DownInteractBoy(){
  //for girl
  //for car1
  if (((car4.x0+25<boy.x-10) ||(car4.y0+25<boy.y-10)||(car4.x0-25>boy.x+10)||(car4.y0-25>boy.y+10))  
  && ((car4.x0-200+25<boy.x-10) || (car4.y0+25<boy.y-10) || (car4.x0-200-25>boy.x+10) ||(car4.y0-25>boy.y+10))
  &&((car4.x0-400+25<boy.x-10)  || (car4.y0+25<boy.y-10) ||(car4.x0-400-25>boy.x+10) ||(car4.y0-25>boy.y+10))
  &&((car4.x0-800+25<boy.x-10) || (car4.y0+25<boy.y-10) ||(car4.x0-800-25>boy.x+10) ||(car4.y0-25>boy.y+10))){
    return false;
  }
  else{
    return true;
  }
}
