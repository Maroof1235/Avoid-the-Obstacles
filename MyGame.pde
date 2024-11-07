//global variables
Player player;
Enemy[] topEnemies = new Enemy[2]; 
Enemy[] leftEnemies = new Enemy[2];
Enemy[] rightEnemies = new Enemy[2];




void setup()
{
  size(500, 500);
  player = new Player(250, 250, 30, 30);
  //Populate enemies array with objects for each direction: top, left and right
  for(int i = 0; i < topEnemies.length; i++)
  {
    int xPos = (int)random(30, 470);
    topEnemies[i] = new Enemy(xPos, 30, 30, 30, 0);
  }
  
  for(int i = 0; i < leftEnemies.length; i++)
  {
    int yPos = (int)random(30, 470);
    leftEnemies[i] = new Enemy(30, yPos, 30, 30, -1);
  }
  
  for(int i = 0; i < rightEnemies.length; i++)
  {
    int yPos = (int)random(30, 470);
    rightEnemies[i] = new Enemy(30, yPos, 30, 30, 1);
  }
  

}

void draw()
{
  background(120);
  player.update();
  
  //Update all enemies in enemy array 
  updateEnemies(topEnemies);
  updateEnemies(rightEnemies);
  updateEnemies(leftEnemies);
  
  collisionWithPlayer(topEnemies);
  collisionWithPlayer(rightEnemies);
  collisionWithPlayer(leftEnemies);
}

//When the specific key is pressed, the move functions are called
void keyPressed()
{
  moveEnemies(topEnemies, keyCode);
  moveEnemies(rightEnemies, keyCode);
  moveEnemies(leftEnemies, keyCode);
}

//When the specific key is pressed, the move functions are called
void moveEnemies(Enemy[] enemies, int keyCode)
{
  for(int i = 0; i < enemies.length; i++)
  {
    switch(keyCode)
    {
      case UP:
        enemies[i].moveDown();
        break;
      case DOWN:
        enemies[i].moveUp();
        break;
      case RIGHT:
        enemies[i].moveLeft();
        break;
      case LEFT:
        enemies[i].moveRight();
        break;
    }
  }
}

//Function to iterate through the Enemy array (depending on which is called within function parameters) and update them 
void updateEnemies(Enemy[] enemies)
{
  for(int i = 0; i < enemies.length; i++)
  {
    enemies[i].update();
  }
}

void collisionWithPlayer(Enemy[] enemies)
{
 for(int i =0; i < enemies.length; i++)
 {
   if(enemies[i].collision(player))
   {
    print("working"); 
   }
 }
}
