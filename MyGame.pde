//global variables
PImage picture;
int x, y; //backgroung x,y - 0,0 to set to top left of screen
int step = 5;
Player player;
Enemy[] topEnemies = new Enemy[2]; 
Enemy[] leftEnemies = new Enemy[2];
Enemy[] rightEnemies = new Enemy[2];

ArrayList<Enemy> allEnemies = new ArrayList<Enemy>();
 
// collectible arraylist and variables
ArrayList<Collectible> collectibles = new ArrayList<Collectible>();
int spawnTimer = 0;
int spawnInterval = 300;

// respawn obstacles object and related
respawnObstacle respawn = new respawnObstacle(2, 1);
int aliveEnemyCount = 0;
int level = 1;
int maxEnemy = 15;

// file reading and high cscore displaying
int currentScore = 1;
int highScore = 0;
String highScoreFile = "highscore.txt";


// arrayList to store explosions
ArrayList<Explosion> explosions = new ArrayList<Explosion>();








void setup()
{
  size(500, 500);
  picture = loadImage("space_bg.png");
  picture.resize(width, height);
  x = 0;
  y = 0;
  // load high score
  highScore = loadHighScore();

  player = new Player(width/2, height/2, 30, 30, 5);
  //Populate enemies array with objects for each direction: top, left and right
  
  // collectible item init
  spawnRandomCollectible();  
  
  // spawn enemies initially
  spawnEnemies(topEnemies, rightEnemies, leftEnemies);


  
  getEnemy(topEnemies, rightEnemies, leftEnemies);
  
  
  

  
}


void draw()
{
  //background(10);
  displayBackground();
  player.update();
  
  if(player.isGameOver())
  {
    player.displayGameOver();
  }
  else
  {
    
    
    //Update all enemies in enemy array 
    updateEnemies(allEnemies, respawn);
    
    fill(255, 0, 0);  
    textSize(15);
    text("Enemies: " + aliveEnemyCount, 5, 35);
    text("Level: " + level, 5, 490);
    text("Score: " + currentScore, 5, 50);
    displayEnemySpeeds();
    displayHighScore();
    
    
    //Display text after drawing so it stays on top
  
    player.displayText(x, y);
    updateCollectibles(collectibles);
    spawnRandomCollectible();  
    
    
    
    // update score
    if(currentScore > highScore)
    {
      highScore = currentScore;
      saveHighScore(highScore);
    }
    
    collisionWithPlayer(allEnemies);
    
    for(int i= explosions.size()-1; i >= 0; i--)
    {
      Explosion explosion = explosions.get(i);
      explosion.display();
      
      if(!explosion.isActive)
      {
        explosions.remove(i);
        
      }
    }
  }
  


 
}

void displayBackground()
{
  imageMode(CORNER);
  for(int col = - 1; col < 2; col++)  //3 columns of background image
  {
    for(int row = -1; row < 2; row++) //3 rows of background image
    {
      image(picture, x + (width*col), y + (height*row));
    }
  }
  //imageMode(CORNER);
  //image(picture, 0, 0, width, height);
  
}

//When the specific key is pressed, the background is moved either in the x or y
void keyPressed()
{

   
   // handle game over sequence
   if(player.isGameOver())
   {
     if(key == 'Q' || key == 'q')
       {
         exit();
       }
   }

   else
   {
      moveObjects(allEnemies, keyCode);
      moveObjects(collectibles, keyCode);
      
      // handle scrolling background
      if(keyCode == UP)
        y += step;
       else if(keyCode == DOWN)
         y -= step;
       else if(keyCode == LEFT)
         x += step;
       else if(keyCode == RIGHT)
         x -= step;
         
        //Reset x and y to 0
       if(x > width || x < -width)
         x = 0;
       if(y > height || y < -height)
         y = 0;
         
         
       // handle changing player apperance
       if(player != null)
       {
         if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
           {
             player.changeImage(keyCode);
             
           }
       }
         
   }
  
  
}

void getEnemy(Enemy[] topEnemies, Enemy[] rightEnemies, Enemy[] leftEnemies)
{
  for(int i = 0; i < topEnemies.length; i++)
  {
     allEnemies.add(topEnemies[i]); 
  }
  
  for(int i = 0 ; i < rightEnemies.length; i ++)
  {
    allEnemies.add(rightEnemies[i]); 
  }
  
  for(int i = 0; i < leftEnemies.length; i++)
  {
    allEnemies.add(leftEnemies[i]); 
  }
  
  aliveEnemyCount = allEnemies.size();
  println("Enemies added: " + aliveEnemyCount);
}

//When the specific key is pressed, the move functions are called
// sub classes of GameObjeect will all be affected by this function
void moveObjects(ArrayList<? extends GameObject> objects, int keyCode)
{
  for(int i = 0; i < objects.size(); i++)
  {
    GameObject obj = objects.get(i);
    if(obj != null)
    {
      obj.move(keyCode);
    }
  }
  
}

//Function to iterate through the Enemy array (depending on which is called within function parameters) and update them 
void updateEnemies(ArrayList<Enemy> allEnemies, respawnObstacle respawn)
{
  boolean enemiesAlive = false;
  for(int i = 0; i < allEnemies.size(); i++)
  {
    
    if(allEnemies.get(i) != null)
    {
      allEnemies.get(i).update();
      enemiesAlive = true;
    }
  }
  
  if(!enemiesAlive)
  {
    spawnNewEnemies(respawn);
  }
  
}

// iterate over enemy arrays and check if collision occurs
void collisionWithPlayer(ArrayList<Enemy> allEnemies)
{
   
   for (int i = allEnemies.size() - 1; i >= 0; i--)
   {
     if (allEnemies.get(i) != null && allEnemies.get(i).collision(player))
     {
       // explosion
       explosions.add(new Explosion(player.x, player.y));
       allEnemies.remove(i);  // remove the enemy [processing]
       aliveEnemyCount--;      // decrement the count after removal
       // reduce health
       player.reduceHealth(1);
       println("Remaining enemies: " + aliveEnemyCount);
     }
   }
}



void updateCollectibles(ArrayList<Collectible> collectibles)
{
  for(int i = 0; i < collectibles.size(); i++)
  {
    collectibles.get(i).display();
  }
  
  // collision between player and collectible
  for(int i = collectibles.size() - 1; i >= 0; i--)
  {
    if(collectibles.get(i).isColliding(player))
    {
      collectibles.get(i).apply(player);
      collectibles.remove(i);
    }
  }
}

boolean scoreUpdated = false;

void spawnNewEnemies(respawnObstacle respawn)
{
  
  
  if(aliveEnemyCount >= maxEnemy)
  {
    println("No new enemies spawned");
    return;
  }
  else
  {
    // increase level
    level++;
    
    // increase the score when level increase, once. 
    if(!scoreUpdated)
    {
      currentScore ++;
      scoreUpdated = true;
    }
    
    
    // increment. This will increase difficulty for the player
    respawn.incrementEnemyCount();
    // divide by 3 as there are three enemy arrays
    int newEnemyCount = Math.min(respawn.getEnemyCount(), maxEnemy/3);
    
    // initialise new arrays to hold new values
    topEnemies = new Enemy[newEnemyCount];
    leftEnemies = new Enemy[newEnemyCount];
    rightEnemies = new Enemy[newEnemyCount];
    
    // repopulate
    spawnEnemies(topEnemies, leftEnemies, rightEnemies);
    
    allEnemies.clear();
    
    // use getEnemy to add to arraylist
    getEnemy(topEnemies, rightEnemies, leftEnemies);
    
    aliveEnemyCount = allEnemies.size();
    
    
    // adjust enemy speed, increase based off level
    for(int i = 0; i < allEnemies.size(); i++)
    {
      Enemy enemy = allEnemies.get(i);
      enemy.speed += level * 0.2;
      
    }
    
    scoreUpdated = false;
  
    
    
    
  }  
}

void displayEnemySpeeds() 
{
    fill(255, 0, 0);
    textSize(15);
    for(int i = 0; i < allEnemies.size(); i++) 
    {
        Enemy enemy = allEnemies.get(i);
        text("Speed: " + enemy.speed, 430, 490);
    }
    fill(255);
}
 
void spawnRandomCollectible()
{
  
  spawnTimer++;
  

  if(spawnTimer >= spawnInterval)
  {
    int xRandom = (int) random(50, width - 50);
    int yRandom = (int) random(50, height - 50);
  
    // check if are any collectibles on screen
    if(collectibles.isEmpty())
    {
      // select random collectible
      collectibleType[] types = collectibleType.values();
      collectibleType type = types[(int)random(types.length)];
      
      Collectible newCollectible = null;
      
      switch(type)
      {
        case health:
            newCollectible = new healthCollectible(xRandom, yRandom, 25, 25);
            break;
    
        case invulnerability:
            newCollectible = new invulnerabilityCollectible(xRandom, yRandom, 25, 25);
            break;
        
            
        default:
            break;
        }
      
      // draw new collectible
      if(newCollectible != null)
      {
        collectibles.add(newCollectible);
      }
      
      spawnTimer = 0;
      spawnInterval = 300;
    }   
  }
}


void spawnEnemies(Enemy[] topEnemies, Enemy[] leftEnemies, Enemy[] rightEnemies)
{
  
  for(int i = 0; i < topEnemies.length; i++)
  {
    
    //these 2 variables ensure that enemies display at random points on the screen when the program is ran
    int xPos = (int)random(30, width - 30);
    int yPos = (int)random(30, height - 30);
    topEnemies[i] = new Enemy(xPos, yPos,40, 40, EnemyDirection.TOP, 1.5);
  }

  for(int i = 0; i < leftEnemies.length; i++)
  {
    
    int xPos = (int)random(30, 470);
    int yPos = (int)random(30, 470);
    leftEnemies[i] = new Enemy(xPos, yPos, 52, 52, EnemyDirection.LEFT, 1.5);
  }
  
  for(int i = 0; i < rightEnemies.length; i++)
  {
    
    int xPos = (int)random(30, 470);
    int yPos = (int)random(30, 470);

    rightEnemies[i] = new Enemy(xPos, yPos, 60, 60, EnemyDirection.RIGHT, 1.5);
  }
  
}

void saveHighScore(int score)
{
  String[] scoreText = {str(score)};
  saveStrings(highScoreFile, scoreText);
  println("New high score saved: " + score);
}

int loadHighScore()
{
  // load high score
  String[] scoreText = loadStrings(highScoreFile);
  
  if(scoreText != null && scoreText.length > 0 && !scoreText[0].isEmpty())
  {
    return Integer.parseInt(scoreText[0]);
  }
  else
  {
    return 0;
  }
}


// display high score from screen, from text file.
void displayHighScore()
{
  fill(255, 0, 0);
  textSize(15);
  text("High Score: " + highScore, 5, 65);
}
