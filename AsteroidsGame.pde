//your variable declarations here
public void setup() 
{
  //your code here
  size(400, 400);
  frameRate(200);

}
SpaceShip bumber = new SpaceShip();
public void draw() 
{
  //your code here
  background(0);
  bumber.move();
  bumber.show();

}
public void keyPressed(){
  if(keyCode == 87){ //w
    bumber.accelerate(0.25); //pretty  fast. constrain
  }
  if(keyCode == 83){bumber.accelerate(-0.25);} //s
  if(keyCode == 65){bumber.rotate(-10);}   //a
  if(keyCode == 68){bumber.rotate(10);}    //d
  if(keyCode == 32){bumber.hyperSpace();}
}
class Stars
{
  int StarX;
  int StarY;
  public Stars(){
    StarX = (int)(Math.random()*400);
    StarY = (int)(Math.random()*400);
  }
  public void show(){
    fill(255,255,0);
    beginShape();
    vertex(StarX, StarY + 5);top
    vertex(StarX -2, StarY + 2);top left
    vertex(StarX - 5, StarY + 2);left
    vertex();bottom left
    vertex();bottom
    vertex(StarX , starY - 5);middle
    vertex();bottom
    vertex();bottom right
    vertex();right
    vertex(StarX + 2, StarY + 2;);top right
    endShape(CLOSE);
  }
}
class SpaceShip extends Floater  
{   
    //your code here

   public SpaceShip(){
    corners = 3;
      yCorners = new int[corners];
     xCorners = new int[corners];
    xCorners[0] = -8;
     xCorners[1] = -8;
     xCorners[2] = 16;
     yCorners[0] = -8;
     yCorners[1] = 8;
     yCorners[2]= 0; 
     myCenterX = 200;
     myCenterY = 200;
     
     myColor = #B266FF;
     myDirectionX = 0;
     myDirectionY = 0;
     myPointDirection = 0;


   }
   public void setX(int x) {myCenterX = x;}
   public int getX(){return (int)myCenterX;}
   public void setY(int y) {myCenterY = y;}
   public int getY() {return (int)myCenterY;}  
   public void setDirectionX(double x) {myDirectionX = x;}   
   public double getDirectionX() {return myDirectionX;}
   public void setDirectionY(double y) {myDirectionY = y;}
   public double getDirectionY() {return myDirectionY;}
   public void setPointDirection(int degrees) {myPointDirection = degrees;}
   public double getPointDirection() {return myPointDirection;}
   public void hyperSpace(){
    setDirectionX(0);
    setDirectionY(0);
    setX((int)(Math.random()*400));
    setY((int)(Math.random()*400));
   }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

