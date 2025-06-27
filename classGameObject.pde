
abstract class GameObject
{
  int x, y, objWidth, objHeight;
  PImage image;
  
  //constructor 
  GameObject(int x, int y, int objWidth, int objHeight)
  {
    this.x = x;
    this.y = y;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.image = null;
    
  }
  
  
   // common methods both classes have
   
   void setImage(String imagePath)
   {
     this.image = loadImage(imagePath);
     if(image == null) 
     {
        println("Failed to load image: " + imagePath);
     }
   }
   
   void display()
   {
     // load if image available
     if(image!= null)
     {
       imageMode(CENTER);
       image(image, x, y, objWidth, objHeight);
     }
   }
   
   // move on keypress
   void move(int keyCode)
   {
     switch(keyCode)
     {
       case UP:
           y += 10;
           break;
       case DOWN:
           y -= 10;
           break;
       case RIGHT:
           x -= 10;
           break;
       case LEFT:
           x += 10;
           break;
     }
     
   }
   
   // common collision method
   boolean isColliding(GameObject other)
   {
     return dist(this.x, this.y, other.x, other.y) < (this.objWidth + other.objWidth) / 2;
   }
   
}
