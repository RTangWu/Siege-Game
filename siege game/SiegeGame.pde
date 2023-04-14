/* This is the code of Siege Game. In this game will have two type attacker which it Barbarian and Warrior
so they will try to climb to the wall. When the attacker climb to wall or collision with the
defender the defender will lose lives. Totaly the defender only have 3 lives also the defender will have a sword to 
stop the attacker climb the wall. When the weapon have hit the attacker then the player will get one point 
when is up to 20 point then will move to next level which it level 2. This game never end so try to 
get the hightest possible you can.
*/
//all this is the variable name of the function and the object
// the variable name for the object and the background
AttackerSetting[] attackerarry = new AttackerSetting[8];
PImage background, userface ; 
Knight player;
Sword weapon;
// this is the name of the gamemode and the current gamemode
enum gameMode{Start,Level1,Level2,Startlevel2,End};
gameMode currentGamemode = gameMode.Start;
// this two boolean is ckheck for the  weapon is drop and the attacker and defender collison
boolean firing= false;
boolean touch= false;
// all this variable name is about the score, lives and saving the score to the file 
int score =0;
int lives = 3;
int highScore;
String[] result;


void setup(){
  size(800,500);
  // open the file and load the file
  result = loadStrings("result.txt");
  highScore = Integer.parseInt(result[1]);
  // set the size of the background
  background = loadImage("brackground3.png");
  background.resize(width,height);
  userface = loadImage("Stony Wall.png");
  userface.resize(width,height);
// to create a object
  for (int i =0; i<attackerarry.length; i++){
    float x = random(0,width);
    float y = random(height,height+300);
   if( i<=3 )
    {
      attackerarry[i] = new Barbarian(x,y);
    }
    if( i>3)
    {
      attackerarry[i] = new Warriors(x,y);
    }
  }
  weapon = new Sword();
 player = new Knight(width/2, height/4);
  
}
//#####################
void draw ()
{
 switch(currentGamemode){
   //when the lunch the game will start on this page frist
   case Start:
     background(userface);
     fill(225,225,225);
     textSize(40);
     textAlign(CENTER);
     text("Welcome to Siege!", width/2, height/2);
     text("press space to start the game", width/2,height*3/4);
     break;
   //##########################################################
   // this one is use for thr level 1 and setting rule inside the level 1
   case Level1:
    background(background); 
    textSize(32);
    text("score=" +score,width/2 -100,30);
    text("Lives=" +lives,width/2 -300,30);
    
    for (int i =0; i<attackerarry.length; i++)
    {
    if(i<2 || i>5){
     attackerarry[i].update();
    }
    }
    player.update();
    weapon.update();
    // when attacker have collision with the defender will run this    
    if(player.HasCrashed())
    {
     lives = lives-1;
     for (AttackerSetting attacker : attackerarry)
     {
       attacker.y = attacker.y+150;
       firing = false;
       
     }
    }
    // when the lives is 0 the game end and when the score is 20 move to level 2
     if (lives == 0)
     {
       currentGamemode = gameMode.End; 
       
     }
     if (score ==20)
     {
       currentGamemode =gameMode.Startlevel2;
     }
      break;
     //#########################################
    case Level2:
    background(background); 
    textSize(32);
    text("score=" +score,width/2 -100,30);
    text("Lives=" +lives,width/2 -300,30);
        for (int i =0; i<attackerarry.length; i++)
    {
    if(i<3 || i>6){
     attackerarry[i].update();
    }
    }
    player.update();
    weapon.update();
    // when attacker have collision with the defender will run this
    if(player.HasCrashed())
    {
     lives = lives-1;
     for (AttackerSetting attacker : attackerarry)
     {
       attacker.y = attacker.y+150;
       firing = false;
       
       
     }
    }
    // when the lives is 0 the game end
     if (lives == 0)
     {
       currentGamemode = gameMode.End; 
      
     }
    break;
      //########################################
    case End:
    // when the lives is equal to zero then will move to this gamemode
      background(0);
       fill(225,225,225);
       textSize(40);
       textAlign(CENTER);
        // print the game  is over when the game is stop
       text("Game over", width/2, height/2);
       text("click your mouse to restart the game ", width/2, height*3/4);
       //when the score is higher then high score this repleace the high score
       if (score >highScore){
       
       
       result[1]=Integer.toString(score) ;
       saveStrings("result.txt", result);
       }
         
        
      
      break;
      // when the game move to level 2 will start this page first to let the player have a break time
      case Startlevel2 :
      background(0);
       fill(225,225,225);
       textSize(40);
       textAlign(CENTER);
       text("Congratulation you have move to level 2", width/2, height/2);
       text("Press space to continue the game ", width/2, height*3/4);
      break;
    }
      

}
 

//################
// this is use to control the game and the defender
 void keyPressed()
 {
   if(key==CODED)
   {
     // this use to move left
     if (keyCode == LEFT)
     {
       touch =false;
       player.x=player.x-player.dx;
     }
     // this use to move right
     else if (keyCode == RIGHT)
     {
        touch = false;
       player.x=player.x+player.dx;
     }
   }
   // this use to drop the weapon to the attacker
   if(firing == false && touch == false)
   {
     if(currentGamemode == gameMode.Level1  || currentGamemode == gameMode.Level2)
     {
       if(key == ' ')
      {
        
        firing =true;
        weapon.x=player.x;
        weapon.y=player.y+player.Hsize/2;
        
      }
     }
   }
   // when the you are in the userface press the space move to level1
     if (currentGamemode == gameMode.Start)
   {
     if(key == ' ')
     {
      currentGamemode = gameMode.Level1;
     }
   }
   // if you in startlevel2 page press space to move to level 2
   if (currentGamemode == gameMode.Startlevel2)
   {
     if(key == ' ')
     {
      currentGamemode = gameMode.Level2;
      for (AttackerSetting attacker : attackerarry)
     {
     attacker.x=random(0,width);
     attacker.y = random(height,height+300);
     }
     }
   }
}

// the game is end click the mouse to start again
 void mouseClicked()
 {
   if ( currentGamemode == gameMode.End)
   {
     
     currentGamemode = gameMode.Level1;
     
     for (AttackerSetting attacker : attackerarry)
     {
     attacker.x=random(0,width);
     attacker.y = random(height,height+300);
     firing = false;
     touch = false;
     score = 0;
     lives = 3;
     }
  
     
     
   }
   
 }
