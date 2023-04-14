// this is the sub class of attacker setting
class Barbarian extends AttackerSetting{
 // the variable name for the picture 
  PImage[] IM = new PImage[2];
  // this is the constructor of the barbarian
  Barbarian(float x,float y) {
    super(x,y);
    IM[0] =loadImage("clipart2990689(2).png");
    IM[0].resize(Wsize,Hsize);
    IM[1] = loadImage("clipart2990689(1).png");
    IM[1].resize(Wsize,Hsize);
    
  }
void movements(){}
//here is picure sequence for the barbarian
void render(){
  
      if (touch == false){
          dy =0.7;
      if (counter>=0 && counter<=15){
        image(IM[0],x,y);
      }
      else if (counter>15 && counter<=30){
        image(IM[1],x,y);
      }
      else if (counter>30 && counter<=45)
      {
        image(IM[0],x,y);
      }
      else if (counter>45 && counter<=60)
      {
        image(IM[1],x,y);
      }
      else 
      {
        counter= counter-60;//restart the sequence
      }
      // this only make the sqeuence +1 so can make the picure to keep running
      counter = counter + countDir;   
   }
   // when the attacker and defender have collision then the attecker will be stop
   if (touch == true)
   {
     dy =0;
     image(IM[0],x,y);
   }
}
}
