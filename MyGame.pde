//global variables
Player player;
Enemy enemy1, enemy2, enemy3;


void setup()
{
  size(500, 500);
  player = new Player();
  enemy1 = new Enemy(30, 50, 50, 50);

  
}

void draw()
{
  background(120);
  player.update();
  enemy1.update();
}

//When the specific key is pressed, the move functions are called
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
