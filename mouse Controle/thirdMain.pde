import processing.video.*;
import java.math.*;


final int s1 = Mesurment.FIRST;
final int s2 = Mesurment.SECOND;
final int realRange = Mesurment.RANGE ;


Capture video ;
  
Calc cl = new Calc();

String[] devices;

//float circleX;
//float circleY;
//float rangeIn;

float mainX;
float mainY;
float mainZ;


int mainRX1 = 120;
int mainRX2 = -45;
int mainBase = 90 ;
int mainGrip = 0;



//PVector mainVector = new PVector(50,50);

//boolean recordObjects = false;

//boolean onAction = false;


boolean onAc = true;

//color trackColor;

//ArrayList<Blob> blobs = new ArrayList<Blob>();


//ArrayList<float[]> objects = new ArrayList<float[]>();


void setup(){
  
  fullScreen();
  //size(640 , 480);
  
  devices= Capture.list();
  
  //circleX= width/2;
  //circleY= height;
  //rangeIn = width/2;
  
  //video = new Capture(this,640, 480,devices[0]);
  //video.start();
  
  imageMode(CENTER);
  
  //if(!onAction){
  //  trackColor = color(190, 60, 61);
  //}
  
  SelectPort();
  
  //initArm();
 
 
}


void draw(){
  
  background(0);
  noFill();
  
  
  //image(video, width/2,height/2);
  
  // if(!onAction){
  //    detect(trackColor , blobs , "Red");
  // }
  
   
  //drawCircle();
  
  //writeTexts();
  
  if (onAc){
    
    rBase( map(mouseX , 0 ,width , 180 ,0 ) );
    move2axis( mainX , map(mouseY , 0 , height , 10 , -8 ) ) ;
  }
}


//void captureEvent(Capture video){
//  video.read();
//}


void mousePressed() {
   OCGrip(!gripState);
}





void keyPressed() {
  if( key == ' '){
    OCGrip(!gripState);
  
  }
  
  
    
    if(key == 'l'){
      rBase((int) mainBase --);
    }else
    
    if(key == 'j'){
      rBase((int) mainBase ++);
    }else 
    
    if(key == 'i'){
      move2axis(mainX,mainY++);
    }else 
    
    if(key == 'k'){  
      move2axis(mainX , mainY--);

    }
    
    
    if ( key == 'x'){
    
      initArm();
    }
    
    
  

}


void mouseWheel(MouseEvent event){

  float e = event.getCount();
  if(e <0 ){
    move2axis(++mainX , mainY);
  
  }else{
    move2axis(--mainX, mainY);
  
  }
  
}
