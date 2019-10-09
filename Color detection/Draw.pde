

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
  
  stroke(0,255,0);
  strokeWeight(3);
  
  stroke(255,0,0);
  strokeWeight(2);
    rectMode(CORNERS);
    rect(width/2 - rangeIn/4, height , width/2 + rangeIn/4, height - rangeIn/1.5);
}


void writeTexts(){
  
  textAlign(RIGHT);
  fill(0);
  text("distance threshold: " + distThreshold, width-10, 25);
  text("color threshold: " + threshold, width-10, 50);
  
  
  
  
  textAlign(LEFT);

  fill(225,0,0);
  text("Red: " + rSize , 10, 30);
  
  fill(0,255,0);
  text("Green: " + gSize ,10 ,50);
  
  fill(0,0,255);
  text("Bleu: " + bSize, 10, 70);
  
  arduinoState();

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
