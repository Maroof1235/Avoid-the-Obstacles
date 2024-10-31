

class Player
{
  final int centre = 250;
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
