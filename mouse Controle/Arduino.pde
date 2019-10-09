import cc.arduino.*;
import javax.swing.JOptionPane;
import processing.serial.*;

Arduino arduino;
  
String portName;

int basePin= 10  , ax1Pin= 5, ax2Pin=6, gripPin= 11 ;


void OpenPort() {
  if (portName == null) exit();
  else if (portName != null) {
    try {
      arduino = new Arduino(this, portName, 9600);
    } 
    catch(Exception e) {
      exit();
    }
  }
}



void SelectPort() {
  String result = (String)JOptionPane.showInputDialog(frame, 
    "Select the port in order to use", 
    "Select Port", 
    JOptionPane.QUESTION_MESSAGE, 
    null, 
    Serial.list(), 0);

  if (result != null) {
    portName = result;
    OpenPort();
  }
  
  setPins();
  
  initArm();
  
}


void setPins(){
  
  if (arduino != null) {
    arduino.pinMode(basePin, Arduino.SERVO);
    arduino.pinMode(ax1Pin, Arduino.SERVO);
    arduino.pinMode(ax2Pin, Arduino.SERVO);
    arduino.pinMode(gripPin, Arduino.SERVO);
  }
  
  


}


void rBase(float t){
  if (arduino != null) {
    
    if(t > mainBase) {
        for ( int i = mainBase ; i < t ; i++){
           
           delay(20);
           arduino.servoWrite(basePin, (int)i);

        }
    }else if ( t < mainBase) {
     
      for ( int i = mainBase ; i > t ; i--){
           delay(20);
           arduino.servoWrite(basePin, (int)i);

        }
      
    }else if ( t == mainBase){
      
    }
    
    mainBase = (int) t ;
    
        
  }
}

void rAx1(float t){
  if ( t < 120 && t >0 ){
    
  if (arduino != null) {
    
    
     if(t > mainRX1) {
        for ( int i = mainRX1 ; i < t ; i++){
           delay(10);
           
           float t1= map(i , 0,120,120,0);
           arduino.servoWrite(ax1Pin, (int)t1);

        }
    }else if ( t < mainRX1) {
     
      for ( int i = mainRX1 ; i > t ; i--){
           delay(10);
           float t1= map(i , 0,120,120,0);
           arduino.servoWrite(ax1Pin, (int)t1);
           
        }
      
    }else if ( t == mainRX1){
      
    }
  
     mainRX1 = (int)t;
  
  }

  }
}

void rAx2(float t){
  if( t > -40 && t < 70) {
    
  if (arduino != null) { 
    
    if(t > mainRX2) {
        for ( int i = mainRX2 ; i < t ; i++){
           delay(10);
           float t1= map(i , -45,70,116,0);
           arduino.servoWrite(ax2Pin, (int)t1);

        }
    }else if ( t < mainRX2) {
     
      for ( int i = mainRX2 ; i > t ; i--){
           delay(10);
           float t1= map(i , -45,70,116,0);
           arduino.servoWrite(ax2Pin, (int)t1);
           
        }
      
    }else if ( t == mainRX2){
      
    }
    
       mainRX2 = (int)t;
    
  }
  
  }
}

void rGrip(float t){
  if (arduino != null) {
   if(t > mainBase) {
        for ( int i = mainGrip ; i < t ; i++){
           
           delay(5);
           arduino.servoWrite(gripPin, (int)i);

        }
    }else if ( t < mainGrip) {
     
      for ( int i = mainGrip ; i > t ; i--){
           delay(5);
           arduino.servoWrite(gripPin, (int)i);

        }
      
    }else if ( t == mainGrip){
      arduino.servoWrite(basePin, (int)t); 
    }
    
    mainGrip = (int) t;
  }
}
