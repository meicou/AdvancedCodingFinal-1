
Img img;
Dessert dessert;
Dessert dessert1;
Dessert dessert2;
int childrenX = 20;
int childrenY = 435;
int dessertSize =100;
int dessert1X = 240;
int dessert1Y = 100;
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
  dessert1 = new Dessert(dessert1X,dessert1Y,2,4,2);
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
   dessert1.show(img);
  dessert1.move(); 

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
   dessert1.speed = 4;
   dessert1.y=100;
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
  if((dessert1.y)>=(390) && (dessert1.y) <= (640) ){
   point+=10*(int)(1+dessert1.speed*0.5);
   dessert1.y=100;}
  }
}