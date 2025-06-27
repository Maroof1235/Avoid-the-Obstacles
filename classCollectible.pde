

public enum collectibleType
{
  health,
  invulnerability
  
}

abstract class Collectible extends GameObject
{
  
  // type meaning power up/upgrade/debuff
  collectibleType type;

  Collectible(int x, int y, int objWidth, int objHeight, collectibleType type)
  {
    super(x, y, objWidth, objHeight);
    this.type = type;
  }
  
  
  
  @Override
  void display()
  {
    super.display();
  }
  
  abstract void apply(Player player);
    
}
  
