

//void drawCircle(){
//  noFill();
//  stroke(255,0,0);
//  strokeWeight(3);
  
//  ellipse(circleX,circleY,rangeIn*2 ,rangeIn*2);

//  stroke(255,0,0,80);

//  ellipse(circleX, circleY, rangeIn*1.5, rangeIn*1.5);
//  ellipse(circleX, circleY, rangeIn*0.7, rangeIn*0.7);

//  for (int i = 1; i < 6; i++) {
//    line(circleX, circleY, (float) ( circleX + (rangeIn * (Math.cos(i * Math.PI /6)))) , (float) ( circleY - (rangeIn * (Math.sin(i * Math.PI /6)))));
//  }
  
//  noStroke(); 
//  fill(255, 0, 0);
//  textAlign(CENTER);
   
  
//  for(float[] f : objects){
//     ellipse(f[0],f[1], 8, 8);
//     text(objects.indexOf(f),f[0],f[1]-15);
//  }
  
//  fill(0, 255, 0);
  
//}


void writeTexts(){
  
  textAlign(RIGHT);
  fill(0);
  text("Base : " + mainBase, width-10, 25);
  text("X : " + mainX, width-10, 50);
  text(" Y : " + mainY , width -10 , 75);
  
  arduinoState();
  
  textAlign(LEFT);

}

void arduinoState(){
  
  textAlign(CENTER);
  fill(255);
  textSize(15);
  if (arduino == null) {
    text("No Arm connected", width/2, 20);
  } else  {
    text("Arm connected on "+ portName, width/2,20);
  }
  
}
