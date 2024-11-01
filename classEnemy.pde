

class Enemy
{
  float x,y, rectWidth, rectHeight, direction;
 
  Player d = new Player();
  Player c = new Player();
  float radius = d.diameter/2;

  
  Enemy(int x, float y, int rectWidth, int rectHeight, int direction)
  {
    this.x = x;
    this.y = y;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
    this.direction = direction; //direction variable that will be used to determine if an obstacle should move in the x axis or y axis
    
  }
  
  
  void display()
  {
    rectMode(CENTER);
    rect(x, y, rectWidth, rectHeight);
    
  }
  
  
  //Method that will be used to make the obstacles travel down the screen
  void moveY()
  {
    float speedY = random(3);
    y+=speedY;
  }
  
  //Obstacles will travel on the x plane
  void moveX()
  {
    float speedX = random(3);
    x+=speedX*direction;
  }
  
  
  //Method that uses the reset position method and randomises the start x and y position. This provides variance to the player. 
  void spawn()
  {
   if(y > 490)
   {
     int xPos = (int)random(30, 470);
     int yPos = (int)random(10, 50);
     enemyResetPosition(xPos, yPos);
   }
   else if(y < 0)
   {
     int xPos = (int)random(30, 470);
     int yPos = (int)random(480, 500);
     enemyResetPosition(xPos, yPos);
   }
   else if(x < 0)
    {
       int xPos = (int)random(440, 470);
       int yPos = (int)random(20, 470);
       enemyResetPosition(xPos, yPos);
    }
    
    else if(x > 490)
    {
       int xPos = (int)random(30, 60);
       int yPos = (int)random(20, 470);
       enemyResetPosition(xPos, yPos);
    }
  }
  
  
  //Method that assigns the values of newX and newY to existing enemy objects to reset their x and y position once they hit bottom of window (or player)
  void enemyResetPosition(int newX, int newY)
  {
    x = newX;
    y = newY;
  }
  
  
  //Collision detection. Checks overlap. If right edge overlaps with left side of circle, as well as other conditions then collision detected. Bounding box collision.
  void collision()
  {
    
    if ((x - (rectWidth/2) <= (c.centre + radius) && //Left edge check
       x + (rectWidth/2) >= (c.centre - radius)) && //Right edge check
      (y + (rectHeight/2) >= (c.centre - radius) && //Bottom edge check
       y - (rectHeight/2) <= (c.centre + radius))) //Top edge check
       {
         print("working ");
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
    spawn();
    if(direction == 0)
    {
      moveY();
    }
    else
    {
      moveX();
    }
  }
  
  
}
