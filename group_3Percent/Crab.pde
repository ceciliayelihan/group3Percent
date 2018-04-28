//Class of crab
class Crabs {
  float x,y,speed,a,b,z;
  //initialize variables
  Crabs(float x, float y, float s, float a, float b, float z) {
    this.x=x;
    this.y=y;
    this.speed=s;
    this.a=a;
    this.b=b;
    this.z=z;
  };
  //method to display the crabs
  void display() {
    PShape crab = createShape(GROUP);
    //body part
    fill(#EA3026);
    noStroke();
    PShape body = createShape(ELLIPSE,x,y,130,110);
    stroke(0);
    strokeWeight(5);
    PShape mouth = createShape(ARC,x,y+10,50,35,0.3,2.94);
    fill(255);
    strokeWeight(1);
    PShape eye1 = createShape(ELLIPSE,x-25,y-50,40,40);
    PShape eye2 = createShape(ELLIPSE,x+25,y-50,40,40);
    fill(0);
    PShape eye3 = createShape(ELLIPSE,x-20,y-45,20,20);
    PShape eye4 = createShape(ELLIPSE,x+20,y-45,20,20);
    //claws
    stroke(#EA3026);
    strokeWeight(15);
    PShape clawbase1 = createShape(LINE,x-88,y-40,x-60,y-20);
    PShape clawbase2 = createShape(LINE,x+88,y-40,x+60,y-20);
    fill(#EA3026);
    strokeWeight(1);
    PShape claw1 = createShape(ARC,x-100,y-50,50,50,-1.5,a);
    PShape claw2 = createShape(ARC,x+100,y-50,50,50,b,4.5);
    //legs
    strokeWeight(10);
    PShape leg1base = createShape(LINE,x-65,y+10,x-85,y+15);
    PShape leg1 = createShape(LINE,x-85,y+15,x-100,y+10+z);
    PShape leg2base = createShape(LINE,x-60,y+22,x-75,y+35);
    PShape leg2 = createShape(LINE,x-75,y+35,x-90,y+35+z);
    PShape leg3 = createShape(LINE,x-50,y+37,x-75,y+55+z);
    PShape leg4 = createShape(LINE,x-40,y+50,x-60,y+70+z);
    PShape leg5base = createShape(LINE,x+65,y+10,x+85,y+15);
    PShape leg5 = createShape(LINE,x+85,y+15,x+100,y+10+z);
    PShape leg6base = createShape(LINE,x+60,y+22,x+75,y+35);
    PShape leg6 = createShape(LINE,x+75,y+35,x+90,y+35+z);
    PShape leg7 = createShape(LINE,x+50,y+37,x+75,y+55+z);
    PShape leg8 = createShape(LINE,x+40,y+50,x+60,y+70+z);
    crab.addChild(body);
    crab.addChild(mouth);
    crab.addChild(eye1);
    crab.addChild(eye2);
    crab.addChild(eye3);
    crab.addChild(eye4);
    crab.addChild(clawbase1);
    crab.addChild(clawbase2);
    crab.addChild(claw1);
    crab.addChild(claw2);
    crab.addChild(leg1base);
    crab.addChild(leg1);
    crab.addChild(leg2base);
    crab.addChild(leg2);
    crab.addChild(leg3);
    crab.addChild(leg4);
    crab.addChild(leg5base);
    crab.addChild(leg5);
    crab.addChild(leg6base);
    crab.addChild(leg6);
    crab.addChild(leg7);
    crab.addChild(leg8);
    crab.scale(0.3);
    shape(crab);
    
    noStroke();
  };
  //method to move the crab in x direction
  void move() {
    this.x+=speed;
    if (x<150) {
      x=150;
      speed=20;
    }
    if (x>width+1700) {
      x=width+1700;
      this.speed=-20;
    }
  }
}
