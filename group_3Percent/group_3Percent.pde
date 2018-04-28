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
//crab
CrabLegs crab;
// Car
PImage car_right;
// car facing right
Car car1;//car 1 and car2 are same, car_right
Car car2;
CarArray carArray1;
CarArray carArray2;
Car car3;
Car car4;
CarArray carArray3;
CarArray carArray4;
//car facing left
Car car5;
Car car6;
CarArray carArray5;
CarArray carArray6;
Car car7;
Car car8;
CarArray carArray7;
CarArray carArray8;
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
  //car facing right
  PImage car_right = loadImage("blue_car.png");
  car1 = new Car(car_right,0,520,10,-200,70); 
  car2 = new Car(car_right,-1000,520,10,-200,70); 
  carArray1 = new CarArray(1,car1);
  carArray2 = new CarArray(1,car2);
  car3 = new Car(car_right,0,400,20,-200,70); 
  car4 = new Car(car_right,-1000,400,20,-200,70); 
  carArray3 = new CarArray(1,car3);
  carArray4 = new CarArray(1,car4);
  PImage car_left = loadImage("red_car.png");
  car5 = new Car(car_left,800,580,-5,200,70); 
  car6 = new Car(car_left,1800,580,-5,200,70); 
  carArray5 = new CarArray(1,car5);
  carArray6 = new CarArray(1,car6);
  car7 = new Car(car_left,800,450,-15,200,70); 
  car8 = new Car(car_left,1800,450,-15,200,70); 
  carArray7 = new CarArray(1,car7);
  carArray8 = new CarArray(1,car8);
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
       text(userName,320,530);
       userName = userName + key;
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
     //display cars-right
  if (carArray1.right_offScreen()==true){
    car1.x0=0;
    carArray1 = new CarArray(1,car1);
  }
  if (carArray2.right_offScreen()==true){
    car2.x0=0;
    carArray2 = new CarArray(1,car2);
  }
    if (carArray3.right_offScreen()==true){
    car3.x0=0;
    carArray3 = new CarArray(1,car3);
  }
  if (carArray4.right_offScreen()==true){
    car4.x0=800;
    carArray4 = new CarArray(1,car4);
  }
    if (carArray5.left_offScreen()==true){
    car5.x0=800;
    carArray5 = new CarArray(1,car5);
  }
  if (carArray6.left_offScreen()==true){
    car6.x0=800;
    carArray6 = new CarArray(1,car6);
  }
    if (carArray7.left_offScreen()==true){
    car7.x0=800;
    carArray7 = new CarArray(1,car7);
  }
  if (carArray8.left_offScreen()==true){
    car8.x0=800;
    carArray8 = new CarArray(1,car8);
  }
  carArray1.display();
  carArray2.display();
  carArray3.display();
  carArray4.display();
  carArray5.display();
  carArray6.display();
  carArray7.display();
  carArray8.display();
  if  (hitCar==true){
    girl.x = 400;
    girl.y = 680;
    girl.display();
    girl.move();
    user.decreaseHealth();
    hitCar=false;
   }
  //crab
  crab.display();
  crab.move();
  crab.legsMove();
 }
}
void CarInteraction(){
  if ((girl.x+50<car1.x0-50)&&(girl.x-50>car1.x0+50)&&(girl.y-50>car1.y0+50)&&(girl.y+50<car1.y0-50)){
    hitCar = false;
    System.out.println(car1.x0);
  }
  else{
    hitCar = true;
  }

}
