
class Explosion extends GameObject
{
  
  int frame = 0;
  int frameDelay = 5;    
  int maxFrames = 4;
  int frameTimer = 0;
  boolean isActive = true;    // flag to check if the explosion is still being animated
  
  Explosion(int x, int y)
  {
    super(x, y, 50, 50);
  }
  
  
  
  @Override
  void display()
  {
    if(isActive)
    {
      frameTimer++;
      if(frameTimer >= frameDelay)
      {
        frameTimer = 0;
        frame++;
        
        
        if(frame >= maxFrames)
        {
          isActive = false;
          
          
        }
        
        String imagePath = ("images/player/explosion/explosion" + (frame + 1) + ".png");    //increment explosion
        setImage(imagePath);
        
      }
      
      super.display();
      
    }
    
    
  }
  
}
