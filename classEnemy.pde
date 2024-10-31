

class Enemy
{
  int x,y, rectWidth, rectHeight;
 
  Player d = new Player();
  Player c = new Player();
  float radius = d.diameter/2;

  
  Enemy(int x, int y, int rectWidth, int rectHeight)
  {
    this.x = x;
    this.y = y;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
  }
  
  void display()
  {
    rectMode(CENTER);
    rect(x, y, rectWidth, rectHeight);
    
  }
  
  //Method that will be used to make the obstacles travel accross the screen
  void travel()
  {
    y+=1;
  }
  
  //Collision detection
  void collision()
  {
    
  if ((x - (rectWidth/2) <= (c.centre + radius) && //Left edge check
     x + (rectWidth/2) >= (c.centre - radius)) && //Right edge check
    (y + (rectHeight/2) >= (c.centre - radius) && //Bottom edge check
     y - (rectHeight/2) <= (c.centre + radius))) //Top edge check
     {
       print("working");
     }
  }
  //Collection of methods that move the obstable a certain direction when a key is pressed.
  void moveUp()
  {
    y -= 10;
  }
  
  void moveDown()
  {
    y += 10;
  }
     
  void moveRight()
  {
    x += 10;
  }
  
  void moveLeft()
  {
    x -= 10;
  }
    
  //Method that calls most functions into one
  void update()
  {
    display();
    collision();
    travel();
  }
  
  
}
