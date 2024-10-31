//global variables
Player player;
Enemy enemy1;


void setup()
{
  size(500, 500);
  player = new Player();
  enemy1 = new Enemy(30, 50);
  
}

void draw()
{
  background(120);
  player.display();
  enemy1.display();
  
}

void keyPressed()
{
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
