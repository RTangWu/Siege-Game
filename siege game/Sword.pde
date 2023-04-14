// this class is use for the weapon
class Sword{
  // the variable name for the picture and the weapon setting
  int counter = 0;
  int countDir=1;
  float x,y;
  int Hsize =height/100*5;
  int Wsize =width/100*5;
  float dy =1.5;
  PImage[] IM = new PImage[4];
  // this is the constructor of the sword
 Sword()
 {
   
  firing = false;
  
   
    IM[0] = loadImage("SwordU.png");
    IM[0].resize(Hsize,Wsize);
    IM[1] = loadImage("SwordD.png");
    IM[1].resize(Hsize,Wsize);
    IM[2] = loadImage("SwordL.png"); 
    IM[2].resize(Wsize,Hsize);
    IM[3] = loadImage("SwordR.png");
    IM[3].resize(Wsize,Hsize);
   
  }
  
 
 //######################
 //here is picure sequence for the sword
 void render(){
  if(firing){
    
      
      y=y+dy;
      
      if (counter>=0 && counter<=7.5){
        image(IM[0],x,y);
      }
      else if (counter>7.5&& counter<=15){
        image(IM[3],x,y);
      }
      else if (counter>15 && counter<=22.5)
      {
        image(IM[1],x,y);
      }
      else if (counter>22.5 && counter<=30)
      {
        image(IM[2],x,y);
      }
      else if (counter>30 && counter<=37.5)
      {
        image(IM[0],x,y);
      }
      else if (counter>37.5 && counter<=45)
      {
        image(IM[3],x,y);
      }
      else if (counter>45 && counter<=52.5)
      {
        image(IM[1],x,y);
      }
      else if (counter>52.5 && counter<=60)
      {
        image(IM[2],x,y);
      }
      else 
      {
        counter= counter-60;//restart the sequence
      }
      // this only make the sqeuence +1 so can make the picure to keep running
      counter = counter + countDir;
  }  
}
//###############
// when the sword is ouside the screen then the player can shoot again
void OutOfScreen(){
if(y >= height+Hsize) 
    {
      firing = false;
    }
}
 /* this function is use to tidy up all the method in one so 
 if I only add this function to object then that object can link to all the function that 
 I create for the object.
 */
void update(){
  OutOfScreen();
  render();
}
}
