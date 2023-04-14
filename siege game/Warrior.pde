// this is the sub class of attacker setting
class Warriors extends AttackerSetting{
  // the variable name for the picture 
  PImage[] IM = new PImage[4];
  // this is the constructor of the warrior
  Warriors(float x,float y) {
    super(x,y);
    IM[0] = loadImage("level2L.png");
    IM[0].resize(Wsize,Hsize);
    IM[1] = loadImage("level2R.png");
    IM[1].resize(Wsize,Hsize);
    IM[2] = loadImage("level2A.png");
    IM[2].resize(Wsize,Hsize);
    IM[3] = loadImage("level2B.png");
    IM[3].resize(Wsize,Hsize);

    
  }
  //#########################
  //here is picure sequence for the warrior
  // when the attacker and defender have collision then the attecker will be stop
  void render(){
     if (touch == true)
   {
     dy =0;
     dx = 0;
     image(IM[0],x,y);
   }
   // this picture sequence is for level 1
  if ( currentGamemode == gameMode.Level1)
  {
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
  
  }
  // this picture sequence is for level 2
  if ( currentGamemode == gameMode.Level2)
  {
    if (touch == false){
          
      if (counter>=0 && counter<=15){
        image(IM[2],x,y);
      }
      else if (counter>15 && counter<=30){
        image(IM[3],x,y);
      }
      else if (counter>30 && counter<=45)
      {
        image(IM[2],x,y);
      }
      else if (counter>45 && counter<=60)
      {
        image(IM[3],x,y);
      }
      else 
      {
        counter= counter-60;//restart the sequence
      }
      // this only make the sqeuence +1 so can make the picure to keep running
      counter = counter + countDir;   
   }
  }
}
//########################
// this movements is only use in level 2
void movements()
{
  
  if ( currentGamemode == gameMode.Level2)
  {
    if(touch == false){
    dx=1;
    dy=1.2;
    if(x > player.x)
    {
      x=x-dx;
    }
    else if(x<player.x)
    {
      x=x+dx;
    }
    else if (y> player.y)
    {
      y=y-dy;
    }
    else if(y<player.y)
    {
      y=y+dy;
    }
    
  }
  }
}



}
