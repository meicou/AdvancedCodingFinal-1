Img img;
Dessert dessert;
Dessert dessert1;
Dessert dessert2;
int childrenX = 20;
int childrenY = 435;
int dessertSize =100;
int eSignX = 240;
int eSignY = 100;
int eSign;
int eSignUp;
int eSignDown;
int eSignRight;
int eSignLeft;
int childrenXsize=250;
int childrenYsize=250;
int life ;
int cakenum;
int score =0;
 import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer alarm;

  

//Game state
int status ;
final int GAME_INITIAL = 1;
final int Level1_start    = 2;
final int Level1_play    = 3;

final int Level2_start    = 4;
final int Level2_play    = 5;
final int Level3_start    = 6;
final int Level3_play    = 7;
final int GAME_LOSE    = 8;
final int GAME_WIN    = 9;
final int Level1_pause    = 10;
final int Level2_pause    = 11;
final int Level3_pause    = 12;


void setup(){
  size (600,640);
  life = 3 ; 
  img = new Img();
 dessert1 = new Dessert(eSignX,eSignY,2,4,2);
  status = 1;
  reset();
}

void draw(){
  noStroke();


  switch(status){
    
   case GAME_INITIAL:
   img.startshow();  
   break;
   
   case Level1_start:
  //img.level1_startpic1_show();

  break;
      
   case Level1_play:
   img.show();
   dessert1.show(img);
   dessert1.move();   
   displaylife();
   drawScore();
   println(score);
   break;
   
   case GAME_LOSE :
   img.endshow();
   finalScore();
 
   break;
   
   case Level2_play:
   img.show();
   dessert1.show(img);
   dessert1.move(); 

   displaylife();
   drawScore();
   println(score);
   break;
   
   case Level3_play:
   img.show();
   dessert1.show(img);
   dessert1.move(); 

   displaylife();
   drawScore();
   println(score);
   break;
   
   
   //case GAME_LOSE :
  //img.endshow();
   //finalScore();
   //alarm.play();
   //break;
  
}
}



void displaylife(){
   int []lifeArr = new int[3];
   for (int n = 0; n < life ; n++ ) {  
   image(img.heart,400+50*n,60);
   lifeArr[n] = n;
   
   }
}

void drawScore() {
  noStroke();
  fill(104,37,138);
  textAlign(CENTER, CENTER);
  textSize(23);
  text("SCORE:"+score, 100, 70);
}
void finalScore(){
  noStroke();
  fill(255,241,0);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(score,310,160);
}

  void reset(){
   displaylife();
   life=3;
   score = 0;
   drawScore(); 
   dessert1.speed = 4;
   dessert1.y=100;
  status = GAME_INITIAL ;
  } 


void keyPressed() {
  if (status == Level1_play||status == Level2_play||status == Level3_play) {
   if (key == CODED ) {
      switch(keyCode){
        case UP:
              if(eSign == eSignUp){
                 score++;
               }
               break;
        case DOWN:
              if(eSign == eSignDown){
                 score++;
               } 
               break;
        case LEFT:
               if(eSign == eSignLeft){
                 score++;
               } 
               break;
        case RIGHT:
               if(eSign == eSignRight){
                 score++;
               }
               break;
    }
   }
}
   if (key == ENTER) {
    switch(status) {

    case GAME_INITIAL:
      status = Level1_start;
     break;
    
    case Level1_start:
     status = Level1_play;
     break;
   
    case Level1_play:
     status = Level1_pause  ;
     break;
   
     case Level1_pause:
     status = Level1_play;
     break;
     case Level2_start:
     status = Level2_play;
     break;
   
    case Level2_play:
     status = Level2_pause  ;
     break;
   
     case Level2_pause:
     status = Level2_play;
     break;
     case Level3_start:
     status = Level3_play;
     break;
   
    case Level3_play:
     status = Level3_pause  ;
     break;
   
     case Level3_pause:
     status = Level3_play;
     break;
  
 
    case GAME_WIN:
      status = GAME_INITIAL;
      reset();
      break;

    case GAME_LOSE:
      status = GAME_INITIAL;
      reset();
      break;
    }
  }
}
