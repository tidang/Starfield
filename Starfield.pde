Particle [] stars;
SpecialParticle [] moreStars;

public void setup()
{
  
  size(800, 800);
  
  stars = new Particle[90000];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new NormalParticle();
  }

  moreStars = new SpecialParticle[100000];
  for(int i = 0; i < moreStars.length; i++){
    moreStars[i] = new SpecialParticle(0, 0, 0, mouseX, mouseY);
  }
  
   for(int i = 0; i < stars.length; i+= 5000){
    stars[i] = new OddballParticle(); 
  }
  
   for(int i = 0; i < stars.length; i+= 300){
    stars[i] = new JumboParticle(); 
  }
    
}
void draw()
{
  background(0);
  
  for(int i = 0; i < stars.length; i++){
    stars[i].move();
    stars[i].show();
  
  }
  
    for(int i = 0; i < moreStars.length; i++){
    moreStars[i].move();
    moreStars[i].show();
     }
  
}

void mousePressed()
{ 
  moreStars = new SpecialParticle[10000];
  for(int i = 0; i < moreStars.length; i++){
    int R = (int) (Math.random() * 256 + 50);
   int G = (int) (Math.random() * 256 + 50);
   int B = (int) (Math.random() * 256 + 50);
    moreStars[i] = new SpecialParticle(R, G, B, mouseX, mouseY);
  }
  
    for(int i = 0; i < moreStars.length; i++){
    moreStars[i].move();
    moreStars[i].show();
     }
}

class NormalParticle implements Particle
{
  double myX, myY, mySpeed;
  int R, G, B, myAngle;
  NormalParticle()
  {
      myX = 400;
      myY = 400;
      myAngle = (int) (Math.random() * 360);
      mySpeed = (double) (Math.random() * 300);
       R = 255;
       G = 255;
       B = 255;
      
  }
  public void move(){
    
   myX = myX + (float)(Math.cos(myAngle)) * mySpeed;
    myY = myY + (float)(Math.sin(myAngle)) * mySpeed;
    myAngle = (int) myAngle - 270;
    
  }
    
 
  public void show(){
   fill(R, G, B);
   noStroke();
   ellipse((float) myX, (int)(myY), 1, 1);
  }
}

interface Particle
{
  public void move();
  public void show();
}

class SpecialParticle implements Particle
{
  double myX, myY, mySpeed;
  int R, G, B, myAngle;
  SpecialParticle(int r, int g, int b, int x, int y)
  {
      myX = x;
      myY = y;
      myAngle = (int) (Math.random() * 360);
      mySpeed = (double) (Math.random() * 300);
       R = r;
       G = g;
       B = b;
      
  }
  public void move(){
    
   myX = myX + (float)(Math.cos(myAngle)) * mySpeed;
    myY = myY + (float)(Math.sin(myAngle)) * mySpeed;
    myAngle = (int) myAngle - 270;
    
  }
    
 
  public void show(){
   fill(R, G, B);
   noStroke();
   ellipse((float) myX, (int)(myY), 1, 1);
  }
}

class OddballParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  
  OddballParticle(){
   myX = 400;
   myY = 400;
   mySpeed = (double) (Math.random() * 50);
   myAngle = (double) (Math.random() * 360);
       
  }
  
  public void move()
  {

    myX = myX + (float)(Math.sin(myAngle)) * mySpeed;
    myY = myY + (float)(Math.cos(myAngle)) * mySpeed;
    myAngle = (int) myAngle - 270;
  }
  
  public void show(){
   fill(113, 113, 113);
   noStroke();
   ellipse((float) myX, (int)(myY), 40, 20);
   

   fill(0);
   noStroke();
   ellipse((float) myX - 10 , (int)(myY) + 5 , 5, 5);
   ellipse((float) myX + 10 , (int)(myY), 5, 5);
   ellipse((float) myX + 5 , (int)(myY) + 5 , 5, 5);
   ellipse((float) myX - 5 , (int)(myY) - 5 , 5, 5);
 
 }
}

class JumboParticle extends NormalParticle
{
  
  void show(){
  fill(255, 255, 255);
  ellipse((float) myX, (float) myY, 5, 5);
  
  }
}
