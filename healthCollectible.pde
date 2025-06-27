
class healthCollectible extends Collectible
{
  healthCollectible(int x, int y, int objWidth, int objHeight)
  {
    super(x, y, objWidth, objHeight, collectibleType.health);
  }
  
  
  @Override
  void apply(Player player)
  {
    player.health += 3;
  }
  
  @Override
  void display()
  {
    this.setImage("images/collectibles/heart.png");
    super.display();
  }
 
  
}
