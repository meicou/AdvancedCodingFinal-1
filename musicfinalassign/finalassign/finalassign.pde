
Img img;
ESign eSign1;
ESign eSign2;
ESign eSign3;
ESign eSign4;
ESign eSign5;
ESign eSign6;
ESign eSign7;

int childrenX = 20;
int childrenY = 435;
//int eSignSize=100;
int eSignX = 240;
int eSignY = 100;
int childrenXsize=250;
int childrenYsize=250;
int life ;
int cakenum;
int point =0;
 import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer alarm;

  

//Game state
int game_state ;
final int GAME_INITIAL = 1;
final int GAME_RUN     = 2;
final int GAME_LOSE    = 3;
final int GAME_FAIL    = 4;

void setup(){
  size (600,640);
  life = 3 ; 
  img = new Img();
  eSign1 = new ESign(eSignX,eSignY,2,4,2,110);
  eSign2 = new ESign(eSignX,eSignY,2,4,2,95);
  eSign3 = new ESign(eSignX,eSignY,2,4,2,70);
  eSign4 = new ESign(eSignX,eSignY,2,4,2,55);
  eSign5 = new ESign(eSignX,eSignY,2,4,2,40);
  eSign6 = new ESign(eSignX,eSignY,2,4,2,25);
  eSign7 = new ESign(eSignX,eSignY,2,4,2,10);
  
  game_state = 1;
  
    minim = new Minim(this);
  song = minim.loadFile("music.mp3");
  alarm = minim.loadFile("alarmring.mp3");
}

void draw(){
  switch(game_state){
   case GAME_INITIAL:
   img.startshow();  
    song.play();
   break;
      
   case GAME_RUN:
   img.show();
   eSign4.show(img);
  eSign4.move(); 

   displaylife();
   drawScore();
   println(point);
   // boy hitTest
        // if (dessertX+50>childrenX && childrenX > dessertX && dessertY <  childrenY && childrenY < dessertY + 50){
        //  image(img.boycry, childrenX, childrenY);
        //  life--;
        // }
   
   break;
   
   /*case GAME_FAIL:
   img.boycry();
    life--;
    delay(300);
    break;
   */
   case GAME_LOSE :
   img.endshow();
   finalScore();
   alarm.play();
   break;
  
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
  text("SCORE:"+point, 100, 70);
}
void finalScore(){
  noStroke();
  fill(255,241,0);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(point,310,160);
}

  void reset(){
   displaylife();
   life=3;
   point = 0;
   drawScore(); 
   eSign1.speed = 4;
   eSign1.y=100;
game_state = GAME_INITIAL ;
  } 


void keyPressed() {
  if(key == ENTER &&  (game_state == GAME_INITIAL)){
    game_state = GAME_RUN ;
  }
  
  if(key == ENTER &&  (game_state == GAME_LOSE)){
    game_state = GAME_INITIAL ;
    reset();
  }
  if(key == 'x' && (game_state == GAME_RUN)){
    img.ggirleat();
  if((eSign1.y)>=(390) && (eSign1.y) <= (640) ){
   point+=10*(int)(1+eSign1.speed*0.5);
   eSign1.y=100;}
  }
}