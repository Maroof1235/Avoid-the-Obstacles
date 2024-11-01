

class Player
{
  final int centre = 250; //Constant used as the player will remain in the centre of the screen at all times and will not change
  float diameter = 30;
  void display()
  {
    ellipse(centre, centre, diameter, diameter);
  }
  
  void update()
  {
   display(); 
  }
  
}
