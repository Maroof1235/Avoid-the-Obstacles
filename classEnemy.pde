
class Enemy
{
  int x,y;
  
  Enemy(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
    rectMode(CENTER);
    rect(x, y, 10, 10);
    
  }
  
  void update()
  {
    display();
  }
  
  
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
    
  
  
}
