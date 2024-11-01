//global variables
Player player;
Enemy[] topEnemies = new Enemy[2]; 
Enemy[] leftEnemies = new Enemy[2];
Enemy[] rightEnemies = new Enemy[2];




void setup()
{
  size(500, 500);
  player = new Player();
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
  for(int i = 0;i < topEnemies.length; i++)
  {
    topEnemies[i].update();
  } 
  
  for(int i = 0;i < leftEnemies.length; i++)
  {
    leftEnemies[i].update();
  } 
  
  for(int i = 0;i < rightEnemies.length; i++)
  {
    rightEnemies[i].update();
  } 
}

//When the specific key is pressed, the move functions are called
void keyPressed()
{
  //Iterate through enemies array and move them accordingly
  switch(keyCode)
  {
    case UP:
      for(int i = 0;i < topEnemies.length; i++)
      {
        topEnemies[i].moveDown();
      }
      for(int i = 0;i < leftEnemies.length; i++)
      {
        leftEnemies[i].moveDown();
      }
      for(int i = 0;i < rightEnemies.length; i++)
      {
        rightEnemies[i].moveDown();
      }
      break;
    case DOWN: 
     for(int i = 0;i < topEnemies.length; i++)
      {
        topEnemies[i].moveUp();
      }
      for(int i = 0;i < leftEnemies.length; i++)
      {
        leftEnemies[i].moveUp();
      }
      for(int i = 0;i < rightEnemies.length; i++)
      {
        rightEnemies[i].moveUp();
      }
      break;
    case RIGHT:
      for(int i = 0;i < topEnemies.length; i++)
      {
        topEnemies[i].moveLeft();
      }
      for(int i = 0;i < leftEnemies.length; i++)
      {
        leftEnemies[i].moveLeft();
      }
      for(int i = 0;i < rightEnemies.length; i++)
      {
        rightEnemies[i].moveLeft();
      }
      break;
    case LEFT:
      for(int i = 0;i < topEnemies.length; i++)
      {
        topEnemies[i].moveRight();
      }
      for(int i = 0;i < leftEnemies.length; i++)
      {
        leftEnemies[i].moveRight();
      }
      for(int i = 0;i < rightEnemies.length; i++)
      {
        rightEnemies[i].moveRight();
      }
      break;
  }
}
