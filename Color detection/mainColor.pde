
import processing.video.*;
import java.math.*;
import java.util.*;




Capture video ;

PImage demo;

  
Calc cl = new Calc();

String[] devices;

float circleX;
float circleY;
float rangeIn;



int mainRX1 = 120;
int mainRX2 = -45;
int mainBase = 90 ;
int mainGrip = 0;


final int s1 = Mesurment.FIRST;
final int s2 = Mesurment.SECOND;
final int realRange = Mesurment.RANGE ;

PVector mainVector = new PVector(50,50);


color trackColorB;
color trackColorG;
color trackColorR;


float threshold = 10;
float distThreshold = 9;

ArrayList<Blob> blobsR = new ArrayList<Blob>();
ArrayList<Blob> blobsG = new ArrayList<Blob>();
ArrayList<Blob> blobsB = new ArrayList<Blob>();


float mainX;
float mainY;
float mainZ;

boolean onAction = false;


final int objHeight = -5; 
final int contHeight = 5 ;

PVector contR = new PVector(201,280);
PVector contG = new PVector(321,262);
PVector contB = new PVector(444,268);

int refBolbSize = 300;
int refContSize = 1000;

int rSize ;
int gSize  ;
int bSize ;


void setup(){
  
  size(640 , 480);
 
  

  
  devices= Capture.list();
  
  circleX= width/2;
  circleY= height;
  rangeIn = width/2;
  
  //video = loadImage("demo.jpg" );
  video = new Capture(this , 640,480,devices[15]);
  video.start();
  
  //printArray(devices);
  
  //SelectPort();
  
  imageMode(CENTER);
  
  trackColorR = color(117, 33, 14);
  trackColorG = color(17, 35, 20); //(89, 118, 51)
  trackColorB = color(31, 49, 66);
  
  SelectPort();
  
  //initArm();
  
  

}


void draw(){
  background(0);
  noFill();
  
  
  image(video, width/2,height/2);
  
  
  if(!onAction){
    detect(trackColorR , blobsR , "red");
    detect(trackColorG , blobsG , "green");
    detect(trackColorB , blobsB , "blue" );
  }
  

 

   
  drawCircle();

  float distance = dist(mouseX ,mouseY ,circleX , circleY);
  float mapped = map(distance,0,rangeIn,0,realRange);
  
  //if(distance < rangeIn){
    
  //  mainVector.set(mouseX-circleX, -mouseY+circleY);
   
  //  move2axis(mapped,mainY);
  //  moveBase(Math.toDegrees(Math.atan2(mainVector.y,mainVector.x)));
    
  //}
  
  
  calculateSizes();
  writeTexts();


  
}


void captureEvent(Capture video){
  video.read();
}


void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  color trackColor = video.pixels[loc];
  
  println(red(trackColor), "+++",green(trackColor), "+++",blue(trackColor));
  
  println("X: " + mouseX +"  Y: " +mouseY );
  
  //move2axis(map(dist(mouseX,mouseY,circleX,circleY) ,0 ,rangeIn, 0 , realRange) , (float)mainY ); 
  
  OCGrip(gripState);  
  gripState= !gripState;

}

void keyPressed() {
  if (key == 'a') {
    distThreshold+=3;
  } else if (key == 'z') {
    distThreshold-=3;
  }
  if (key == 's') {
    threshold+=1;
  } else if (key == 'q') {
    threshold-=1;
  }
  
  if(key == ' '){
    onAction=true;
  
    thread("beginAll");
    
    print("hello");
  }
  
  
  
  if(key == 'h'){
    move2axis(++mainX , mainY);
  }else if( key == 'f'){
    move2axis(--mainX , mainY);
  }else if(key == 't'){
    move2axis(mainX , ++mainY);
  }else if( key == 'g'){
    move2axis(mainX , --mainY);
  }



}
