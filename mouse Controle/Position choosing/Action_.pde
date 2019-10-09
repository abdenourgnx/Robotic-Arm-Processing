



void onAction(){
  
  PVector p = new PVector(0,0);
  PVector d = new PVector(0,0); 
  int delay = 600;
  
  for(int i=0 ; i<objects.size() ; i++){
    
      float ox = objects.get(i)[0];
      float oy= objects.get(i)[1];
      
      float px = places.get(i)[0];
      float py = places.get(i)[1];
      
      p.set(ox-circleX, -oy+circleY);
      d.set(px-circleX , -py+circleY ); 
      
      
      float distance = dist(ox ,oy ,circleX , circleY);
      float mapped = map(distance,0,rangeIn,0,realRange);
      
      float distanceC = dist(px, py ,circleX , circleY);
      float mappedC = map(distanceC,0,rangeIn,0,realRange);
      
      double baseTO = Math.toDegrees(Math.atan2(p.y,p.x));
      double baseTP =  Math.toDegrees(Math.atan2(d.y,d.x));
      
      initArm();
      delay(delay);
      
      move2axis(14 , mainY);
      delay(delay);
      moveBase(baseTO);
      delay(delay);
      move2axis(mapped , mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      move2axis(mainX , objHeight);
      delay(delay);
      OCGrip(true);
      delay(delay);
      move2axis(14 , 8);
      delay(delay);
      moveBase(baseTP);
      delay(delay);
      move2axis(mappedC ,mainY);
      delay(delay);
      move2axis(mainX, mainY-3);
      delay(delay);
      OCGrip(false);
      delay(delay);
      
   initArm();  
      
 
  }
  
  finish();
 
}

void finish(){
  onAction=false;
  objects.clear();
  places.clear();
  
  recordObjects = false ;
  recordPlaces = false ;
  
  
}
