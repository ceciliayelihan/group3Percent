//create a subclass Legs
class CrabLegs extends Crabs {
  //initialize variables
  CrabLegs(float x, float y, float s, float a, float b, float z) {
    super(x,y,s,a,b,z);
  }
  //method to move legs
  void legsMove() {
    if (z<=6) {
      z++;
    } else {
      z=0;
    }
  }
}
