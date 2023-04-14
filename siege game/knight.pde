// this class is use for the defender
class Knight{
  // the variable name for the picture and the defender setting
  int counter = 0;
  int countDir=1;
  float x,y;
  float dx =6;
  PImage[] IM = new PImage[5];
  int Hsize =height/100*16;
  int Wsize =width/100*6;
  
// this is the constructor of the knight
 Knight(int x, int y)
{
    this.x =x;
    this.y = y;
    touch =false;
    IM[0] = loadImage("knightL(1).png");
    IM[0].resize(Wsize,Hsize);
    IM[1] = loadImage("knightR(1).png");
    IM[1].resize(Wsize,Hsize);
    IM[2] = loadImage("knightC(1).png");
    IM[2].resize(Wsize,Hsize);
    IM[3] = loadImage("fizzy.png");
    IM[3].resize(Hsize,Wsize);
    IM[4] = loadImage("Ofizzy.png");
    IM[4].resize(Hsize,Wsize);
}
//############### 
//when the player press right will change the picture move to the right
//same for the left and when is not press right and left will change the picture stand the in the wall
void render(){
  if(touch ==false){
  if (keyCode != LEFT && keyCode != RIGHT)
  {
    image(IM[2],x,y);
  }
  else if(keyCode == LEFT)
  {
    image(IM[0],x,y); 
    
   }
  else if (keyCode == RIGHT)
  {
    image (IM[1],x,y);
  }
  
}
}

//####################
// this boolean is use to check the attacker and defender is have been collision or not 
// when is yes touch will change to true
   boolean HasCrashed(){
    

      if(currentGamemode == gameMode.Level1||currentGamemode == gameMode.Level2  ){
      for (AttackerSetting attacker : attackerarry){
      if (dist(x, x, attacker.x, attacker.x) <=Wsize+Wsize/3 && dist(y, y, attacker.y, attacker.y) <= Hsize+Hsize/3)  {
        attacker.y=random(height,height+300);
        attacker.x = random(0,width);
        touch = true;
        return true;
        
      }
      
    }
    } 
     
    return false;
  
  }
 //#####################
 // this function to keep the player stay inside the screen
  void collisionOfedge()
  {
    //this code is for the right
   if (x+30>=width )
   {
     x=x-dx;
   }
   // this is for the left
   else if (x-Wsize+Wsize/2<0)
   {
     x=x+dx;
   } 
  }
 //#####################
 //so when touch is ture then make the some effects to the defender by useing the picure sequence
 void collisionEffects()
 {
   if (touch == true) 
   {
     image (IM[2],x,y);
     if (counter>=0 && counter<=15){
        image (IM[3],x,y-Hsize/2);
        
      }
      else if (counter>15&& counter<=30){
        image (IM[4],x,y-Hsize/2);
      
      }
      else if (counter>30 && counter<=45)
      {
        image (IM[3],x,y-Hsize/2);
       
      }
      else if (counter>45&& counter<=60)
      {
        image (IM[4],x,y-Hsize/2);
       
      }
      
      else 
      {
        counter= counter-60;//restart the sequence
      }
      // this only make the sqeuence +1 so can make the picure to keep running
      counter = counter + countDir;
     
     
     
     
   }
 }
 //#####################
 /* this function is use to tidy up all the method in one so 
 if I only add this function to object then that object can link to all the function that 
 I create for the object.
 */
  void update()
  {
    render();
    collisionOfedge();
    collisionEffects();
    
  }
}
