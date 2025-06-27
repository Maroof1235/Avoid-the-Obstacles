
enum EnemyDirection 
{
  TOP(0), 
  LEFT(-1), 
  RIGHT(1);
  final int value;
  EnemyDirection(int value) 
  {
    this.value = value;
  }
  
}

class Enemy extends GameObject 
{
    // enemy specific properties
    float xVelocity, yVelocity;
    EnemyDirection direction;
    float speed;
    // animation variables
    int frame = 0;
    int frameDelay = 5;
    int maxFrames = 16;
   
    
    Enemy(int x, int y, int objWidth, int objHeight, EnemyDirection direction, float speed) 
    {
        // call parent constructor
        super(x, y, objWidth, objHeight);
        this.direction = direction;
        this.speed = speed;
        setImage("images/asteroids/large/a10000.png");
    }
    
  @Override
  void display()
  {
    frame++;
    
    if(frame % frameDelay == 0)
    {
      // when frame/delay = frame x maxFrames then remainder would be 0. loops back 
      int currentFrame = (frame/frameDelay) % maxFrames;
      
      // format code. set number to be minimum 5 digits
      String frameNumber = String.format("%05d", 10000 + currentFrame);
      String imagePath = ("images/asteroids/large/a" + frameNumber + ".png");
      setImage(imagePath);
      
    }
    
    super.display();

  }



  //Method that will be used to make the obstacles travel down the screen
  void moveY()
    {
      y+=speed;
    }
  
    //Obstacles will travel on the x plane
    void moveX()
    {
      x+=speed * direction.value;
    }


  //iterating backwards ensures that removing elements wont affect the remaining objects
  void enemyNull(ArrayList<Enemy> allEnemies)
  {
    for (int i = allEnemies.size() - 1; i >= 0; i--) 
    {
      if (allEnemies.get(i) != null && allEnemies.get(i).isOffScreen()) 
      {
        allEnemies.remove(i);
        aliveEnemyCount--;
      }
    }
  }

  boolean isOffScreen()
  {
    return x < 0 || x > width || y < 0 || y > height;
  }

  //Method that calculates the distance between two points.
  boolean collision(Player other)
  {
    return isColliding(other);
    
  }

  //This method is so an obstacle isn't detecting collision against itself
  boolean collisionEnemyCheck(ArrayList<Enemy> allEnemies)
  {
    for (int i = 0; i < allEnemies.size(); i++)
    {
      Enemy otherEnemy = allEnemies.get(i);
      if (allEnemies.get(i) != this) //make sure to not check collision against itself
      {
        if (allEnemies.get(i) != null && dist(this.x, this.y, otherEnemy.x, otherEnemy.y) < 33)
        {
          return true;
        }
      }
    }
    return false;
  }




  //Method that calls most functions into one
  void update()
  {
    display();
    enemyNull(allEnemies);
    if (direction == EnemyDirection.TOP)
    {
      moveY();
    } else
    {
      moveX();
    }
  }
}
