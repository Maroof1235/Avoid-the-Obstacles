//global variables
Player player;
Enemy enemy1;


void setup()
{
  size(500, 500);
  player = new Player();
  enemy1 = new Enemy(10, 50);
  
}

void draw()
{
  background(120);
  player.display();
  enemy1.display();
  
}

void keyPressed()
{
  //if (keyCode == UP)
  //{
  // enemy1.moveDown();
  //}
  //else if (keyCode == DOWN)
  //{
  // enemy1.moveUp();
  //}
  //else if (keyCode == RIGHT)
  //{
  // enemy1.moveLeft();
  //}
  //else 
  //{
  // enemy1.moveRight();
  //}
  switch(keyCode)
  {
    case UP:
      enemy1.moveDown();
      break;
    case DOWN:
      enemy1.moveUp();
      break;
    case RIGHT:
      enemy1.moveLeft();
      break;
    case LEFT:
      enemy1.moveRight();
      break;
  }
}
