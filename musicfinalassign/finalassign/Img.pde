class Img{
      PImage background;
      PImage greengirl;
      PImage greengirlopen;
      PImage chococake;
      PImage strawcake;      
      PImage heart;
      PImage ccake;
      PImage scake;
      PImage donet;
      PImage startimage;
      PImage endimage;
      PImage house;
      
      Img(){
        this.endimage   = loadImage("data/END.png");
        this.startimage = loadImage("data/START.png");
        this.background = loadImage("data/background.png") ;
        this.greengirl  = loadImage("data/ggirl.png");
        this.heart      = loadImage("data/heart.png");
        this.ccake      = loadImage("data/ccake.png");
        this.scake      = loadImage("data/scake.png");
        this.donet      = loadImage("data/donet.png");
        this.greengirlopen    = loadImage("data/ggirlopen.png");
        this.house      = loadImage("data/house.png");
      }
      
      void show(){
       image(this.background,0,0);
       image(this.house,0,0);
       image(this.greengirl,childrenX+155,childrenY,childrenXsize,childrenYsize);
      }
      void ggirleat(){
        image(this.greengirlopen,childrenX+155,childrenY,childrenXsize,childrenYsize);
      }
      void startshow(){
       image(this.startimage,0,0);
      }
      void endshow(){
        image(this.endimage,0,0);
      }
}