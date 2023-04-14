/* this is the super for the attacker becasue i have two type attacker so i have set the 
super for the attacker. this super also is the abstract calss
*/
abstract class AttackerSetting{
 // variable name for the attacker
 float x,y;
  float dy;
  float dx;
  int counter = 0;
  int countDir=1;
int Hsize =height/100*16;
  int Wsize =width/100*6;
  // this is the constructor of the attacker setting
AttackerSetting(float x,float y)
{
  imageMode(CENTER);
  this.x = x;
  this.y=y;
  touch=false;
  
}
//#########################
 /* this function is use to tidy up all the method in one so 
 if I only add this function to object then that object can link to all the function that 
 I create for the object.
 */
void update()
  {
    
    render();
    move();
    GetHit();
    OutOfScreen();
    movements();
    
    
  }
abstract void render();
abstract void movements();
//#######################
// this function to make the attacker moving up
void move(){
  y= y-dy;
}

//####################
// when the weapon hit the attacker will go back to the bottom the score will add 1
 void GetHit()
{
  if(dist(x, x, weapon.x, weapon.x) <=Wsize+weapon.Wsize/3 && dist(y, y, weapon.y, weapon.y) <= Hsize+weapon.Hsize/3){
        y=random(height,height+300);
        x = random(0,width);
        firing = false;
        score++;
        weapon.x = width+ 50;
      }
}
//###########################  
// when the attacker have been climb to the top the defender will lose one lives 
// also will send the attacker to the bottom
void OutOfScreen()
{
if(y <= height/3)
    {
      x = random(width);
      y=height;//
      lives = lives-1; 

    }
// when the attacker is outside the screen send the attacker inside the screen
if (x>= width-Wsize)
{
  x =width -Wsize;
  
}
if (x<= 0+Wsize/2)
{
  x =0+Wsize;
  
}
}
  

  
  
  
  
  
}
