
class Player extends GameObject
{
  final int centre = 250; //Constant used as the player will remain in the centre of the screen at all times and will not change
  //float diameter2;
  int health;
  boolean isInvulnerable = false;
  int invulnerabilityTimer = 0;
  int invulnerabilityDuration = 300;
  private boolean isGameOver = false;
  
  
  Player(int x, int y, int objWidth, int objHeight, int health)
  {
    super(x, y, objWidth, objHeight);
    this.health = health;
    // player sprite
    setImage("images/player/up.png");
  }
  
  void changeImage(int keyCode)
  {
    switch(keyCode)
    {
      case UP:
          setImage("images/player/up.png");
          break;
      case DOWN:
          setImage("images/player/down.png");
          break;
      case RIGHT:
          setImage("images/player/right.png");
          break;
      case LEFT:
          setImage("images/player/left.png");
          break;
    }
  }
  
  
  void reduceHealth(int damage)
  {
    if(!isInvulnerable)
    {
      health -= damage;
      if(health <= 0)
      {
        health = 0;
        setGameOver(true);
        //println("Game Over");
      }
    }
    
  }

  void displayText(int x, int y)
  {
    fill(255, 0, 0);  
    textSize(15);
    text("Health: " + health, 5, 20);
    text("X: " + x + ",", 400, 20);
    text("Y: " + y, 450, 20);
    if(isInvulnerable)
    {
      text("Invulnerability: " + invulnerabilityTimer, 370, 40);
    }
    fill(255);
  }
  
  
  boolean isGameOver()
  {
    return health <= 0;
  }
  
  void displayGameOver()
  {
    if (isGameOver())
    {
      fill(255, 0, 0);
      textSize(45);
      textAlign(CENTER, CENTER);
      text("GAME OVER", width/2, 150);
      textSize(35);
      text("Press'Q' to quit!", width/2, height/2);
      textSize(30);
      text("Final Score: " + currentScore, width/2, height/2 + 80);
      
    }
    
  }
  
  void invulnerability()
  {
    if(isInvulnerable)
    {
      invulnerabilityTimer--;
      if(invulnerabilityTimer <= 0)
      {
        isInvulnerable = false;
      }
    }     
  }

  @Override
  void display()
  {
    if(image != null)
    {
      image(image, centre, centre, objWidth, objHeight);
    }
    //ellipse(centre, centre, objWidth, objHeight);
  }
  
  // boolean flag to check if game is over
  private void setGameOver(boolean isGameOver)
  {
    this.isGameOver = isGameOver;
    
    
  }
  
  void update()
  {
    if(!isGameOver())
    {
      display(); 
      invulnerability();
      
      
    }
   
  }
  
}
