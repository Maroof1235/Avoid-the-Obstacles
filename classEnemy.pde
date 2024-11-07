

class Enemy
{
  float x,y, rectWidth, rectHeight, direction;
 
  Player d = new Player(250, 250, 30, 30);
  Player c = new Player(250, 250, 30, 30);
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
  
  //Method that calculates the distance between two points. 33.5 is the distance that the two points must be less than to detect collision
  boolean collision(Player other)
  {
     return dist(this.x ,this.y, other.x, other.y) < 33.5;
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
