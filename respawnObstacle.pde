
class respawnObstacle
{
  // enemies to spawn
  private int enemyCount;
  private int incrementStep;
  
  respawnObstacle(int initialCount, int incrementStep)
  {
    this.enemyCount = initialCount;
    this.incrementStep = incrementStep;    
  }
  
  
  // get current enemy count
  int getEnemyCount()
  {
    return enemyCount;
  }
  
  
  //increase enemy count but use a cap. 
  void incrementEnemyCount()
  {
    if((enemyCount + incrementStep) * 3 > maxEnemy)
    {
      enemyCount = maxEnemy / 3;
    }
    else
    {
      enemyCount += incrementStep;
    }
    
  }
  
  
  
}
