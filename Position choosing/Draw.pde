

void drawCircle(){
  noFill();
  stroke(255,0,0);
  strokeWeight(3);
  
  ellipse(circleX,circleY,rangeIn*2 ,rangeIn*2);

  stroke(255,0,0,80);
  
 
  ellipse(circleX, circleY, rangeIn*1.32, rangeIn*1.32);
  ellipse(circleX, circleY, rangeIn*0.66, rangeIn*0.66);
  
  
  for (int i = 1; i < 6; i++) {
    line(circleX, circleY, (float) ( circleX + (rangeIn * (Math.cos(i * Math.PI /6)))) , (float) ( circleY - (rangeIn * (Math.sin(i * Math.PI /6)))));
  }
  
  noStroke(); 
  fill(255, 0, 0);
  textAlign(CENTER);
   
  
  for(float[] f : objects){
     ellipse(f[0],f[1], 8, 8);
     text(objects.indexOf(f),f[0],f[1]-15);
  }
  
  fill(0, 255, 0);
  
  for(float[] f : places){
     ellipse(f[0],f[1], 8, 8);
     text(places.indexOf(f),f[0],f[1]-15);
  }
}


void writeTexts(){
  
  textAlign(RIGHT);
  fill(0);
  text("distance threshold: " + distThreshold, width-10, 25);
  text("color threshold: " + threshold, width-10, 50);
  
  arduinoState();
  
  textAlign(LEFT);
  
  text("objects : " + objects.size(), 10, 25);
  text("places : " + places.size(), 10, 50);
  
  

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
