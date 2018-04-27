class CarArray{
  ArrayList <Car> Cars;
  int number;//number of cars in array
  Car car;
  public CarArray(int number,Car car){
    this.number = number;
    this.car = car;
    Cars = new ArrayList <Car>();
    for (int i =0; i<this.number;i++){
      Cars.add(car);
    }
  }
  void display(){
    for (int i =0;i<this.number;i++){
      Car c = Cars.get(i);
      c.move();
      c.display();
    }
  }
  Boolean right_offScreen(){
    for (int i =0;i<this.number;i++){
      Car c = Cars.get(i);
      if (c.x0-800<800){
        return false;
      }
    }
    return true;
   }
   Boolean left_offScreen(){
     for (int i =0;i<this.number;i++){
       Car c = Cars.get(i);
       if (c.x0+800>0){
         return false;
      }
    }
    return true;
   }
}