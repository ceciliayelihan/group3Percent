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
    PShape body = createShape(ELLIPSE,x,y,40,35);
    stroke(0);
    strokeWeight(2);
    PShape mouth = createShape(ARC,x,y+3,15,10,0.3,2.94);
    fill(255);
    strokeWeight(1);
    PShape eye1 = createShape(ELLIPSE,x-7.5,y-15,12,12);
    PShape eye2 = createShape(ELLIPSE,x+7.5,y-15,12,12);
    fill(0);
    PShape eye3 = createShape(ELLIPSE,x-6,y-13.5,6,6);
    PShape eye4 = createShape(ELLIPSE,x+6,y-13.5,6,6);
    //claws
    stroke(#EA3026);
    strokeWeight(3);
    PShape clawbase1 = createShape(LINE,x-26,y-12,x-18,y-6);
    PShape clawbase2 = createShape(LINE,x+26,y-12,x+18,y-6);
    fill(#EA3026);
    strokeWeight(1);
    PShape claw1 = createShape(ARC,x-30,y-15,15,15,-1.5,a);
    PShape claw2 = createShape(ARC,x+30,y-15,15,15,b,4.5);
    //legs
    strokeWeight(3);
    PShape leg1 = createShape(LINE,x-19.5,y+4.5,x-30,y+3+z);
    PShape leg2base = createShape(LINE,x-18,y+6.6,x-22.5,y+10.5);
    PShape leg2 = createShape(LINE,x-22.5,y+10.5,x-27,y+10.5+z);
    PShape leg3 = createShape(LINE,x-15,y+11.1,x-22.5,y+16.5+z);
    PShape leg4 = createShape(LINE,x-12,y+15,x-18,y+21+z);
    PShape leg5 = createShape(LINE,x+19.5,y+4.5,x+30,y+3+z);
    PShape leg6base = createShape(LINE,x+18,y+6.6,x+22.5,y+10.5);
    PShape leg6 = createShape(LINE,x+22.5,y+10.5,x+27,y+10.5+z);
    PShape leg7 = createShape(LINE,x+15,y+11.1,x+22.5,y+16.5+z);
    PShape leg8 = createShape(LINE,x+12,y+15,x+18,y+21+z);
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
    crab.addChild(leg1);
    crab.addChild(leg2base);
    crab.addChild(leg2);
    crab.addChild(leg3);
    crab.addChild(leg4);
    crab.addChild(leg5);
    crab.addChild(leg6base);
    crab.addChild(leg6);
    crab.addChild(leg7);
    crab.addChild(leg8);
    shape(crab);
    noStroke();
  };
  //method to move the crab in x direction
  void move() {
    this.x+=speed;
    if (x<50) {
      x=50;
      speed=15;
    }
    if (x>width-50) {
      x=width-50;
      this.speed=-15;
    }
  }
}
