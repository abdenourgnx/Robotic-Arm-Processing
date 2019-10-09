
boolean gripState = false ;


void moveBase(double theta){
  rBase((float) theta);
  println(theta);
}



void move2axis(float x , float y ){
  if ( x >5  && x< 17){
    
  int t1 = mainRX1;
  int t2 = mainRX2;
  
  
  
  double dist = cl.distance(x,y);
  
  
  
  
  if( y >= 0){
  
    double d1 = Math.atan2(y,x);
    double d2 = cl.lawOfCos(dist,s1,s2);  
    
    double theta1 = (d1+d2) ;
    
    double thetaH = cl.lawOfCos(s1,s2,dist);
    
    double theta2 = Math.PI - theta1 - thetaH;
    
     t1 = (int)Math.toDegrees(theta1);
     t2 = (int)Math.toDegrees(theta2);
  
  }else{
    
    double d1 = Math.atan2(y,x);
    double d = cl.lawOfCos(dist,s1,s2);
    
    double dPrime = d + d1;
    
    double thetaH = cl.lawOfCos(s1,s2,dist);
    
    
    t1 = (int) Math.toDegrees(dPrime);
    
    t2 = (int) Math.toDegrees( Math.PI - dPrime - thetaH ) ;
    
  
  }
  
  println ("t1 : " , t1 ,"t2 : " , t2);
  
  
  rAx1(t1 );

  
  rAx2(t2 );
  
  
  mainX= x;
  mainY= y;
  
  println("X : " + mainX + "   Y : "+ mainY ) ;
  
  }
}

void OCGrip(boolean i){
  
         if(i == true ){
            rGrip(0); println("grip close");
         }else{
           rGrip(150);println("grip open");
         }
         
         gripState= !gripState ;
}


void initArm(){
  move2axis(14 , 8);
  //delay(50);
  moveBase(90);
  
  //rAx1(0);
  
  delay(1000);
  
  
  
}
