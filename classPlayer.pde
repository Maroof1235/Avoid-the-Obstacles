//final color CLEAR = color(0, 0, 0);
//final color RED = color(255, 0, 0);
//final color RED = color(255, 0, 0);
//final color RED = color(255, 0, 0);
//final color RED = color(255, 0, 0);

class Player
{
  final int centre = 250; //Constant used as the player will remain in the centre of the screen at all times and will not change
  int x,y;
  //color colour;
  float diameter = 30;
  float diameter2;
  
  Player(int x, int y, float diameter, float diameter2)
  {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.diameter2 = diameter2;
    //this.colour = colour;
  }
  
  //void changeColour(color colour)
  //{
  //  Player(colour);
  //}
  void display()
  {
    ellipse(centre, centre, diameter, diameter);
  }
  
  void update()
  {
   display(); 
  }
  
}
