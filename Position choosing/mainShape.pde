import processing.video.*;
import java.math.*;


final int s1 = Mesurment.FIRST;
final int s2 = Mesurment.SECOND;
final int realRange = Mesurment.RANGE ;


Capture video ;
  
Calc cl = new Calc();

String[] devices;

float circleX;
float circleY;
float rangeIn;

float mainX;
float mainY;
float mainZ;


int mainRX1 = 120;
int mainRX2 = -45;
int mainBase = 90 ;
int mainGrip = 0;


PVector mainVector = new PVector(50,50);

boolean recordObjects = false;
boolean recordPlaces = false ;

boolean onAction = false;


color trackColor;


float threshold = 25;
float distThreshold = 50;

ArrayList<Blob> blobs = new ArrayList<Blob>();

ArrayList<float[]> places = new ArrayList<float[]>();
ArrayList<float[]> objects = new ArrayList<float[]>();




final int objHeight = -5; 
final int contHeight = 6 ;

void setup(){
  
  size(640 , 480);
  
  devices= Capture.list();
  
  circleX= width/2;
  circleY= height;
  rangeIn = width/2;
  
  video = new Capture(this,640, 480,devices[15]);
  video.start();
  
  imageMode(CENTER);
  
  if(!onAction){
    trackColor = color(190, 60, 61);
  }
  
  SelectPort(); 
  
  
 
}


void draw(){
  background(0);
  noFill();
  
  
  image(video, width/2,height/2);
   //if(!onAction){
   //    detect(trackColor , blobs , "Red");
   //}
 

   
  drawCircle();
  
   writeTexts();
  
}


void captureEvent(Capture video){
  video.read();
}


void mousePressed() {
  float distance = dist(mouseX ,mouseY ,circleX , circleY);
  float mapped = map(distance,0,rangeIn,0,realRange);
  
  if(distance < rangeIn){
    
    if(recordObjects){
      
      //for(Blob b : blobs) {
      //  if(dist(b.getX(),b.getY(),mouseX,mouseY) < 10 ){
          //float[] cord = {b.getX(),b.getY()};
          float[] cord = {mouseX,mouseY};
          objects.add(cord);
          println("object at : " + cord[0] + " +++ " + cord[1] );
          //b.recorded = true;
      //  }
      //}
      
    }else if (recordPlaces){
      
      //if(places.size() == objects.size()){
        
        float[] cord = {mouseX,mouseY};
        places.add(cord);
        
        println("place at : " + cord[0] + " +++ " + cord[1] );
      //}else{ println("you can't add more ") ;}
    }
    
  }else{
    println("out of range");
  }
  
  
  int loc = mouseX + mouseY*video.width;
  color trackColor = video.pixels[loc];
  
  println(red(trackColor), "+++",green(trackColor), "+++",blue(trackColor));
  
 
  
}

void keyPressed() {
  if (key == 'a') {
    distThreshold+=5;
  } else if (key == 'z') {
    distThreshold-=5;
  }
  if (key == 's') {
    threshold+=5;
  } else if (key == 'q') {
    threshold-=5;
  }else
  
  if( key =='o') {
    
    recordPlaces= false;
    recordObjects=true;
    
    println("obj recording");
  }else if( key =='p') {
    
    recordObjects=false;
    recordPlaces=true;
    println("places recording");
    
  }else if(key ==' '){
    onAction=true;
    thread("onAction");
    
    
  }

}
