


void beginAll(){
  
  PVector p = new PVector(0,0);
  PVector d = new PVector(0,0); 
  int delay = 500;
  
  for(Blob b: blobsR){
    if (b.size() > refBolbSize && !b.container && b.size() < refContSize && check((int)b.getX() ,(int) b.getX())) {
      
      d.set(contR.x-circleX , -contR.y+circleY ); 
      p.set(b.getX()-circleX, -b.getY()+circleY);
      
      
      float distance = dist(b.getX() ,b.getY() ,circleX , circleY);
      float mapped = map(distance,0,rangeIn,0,realRange);
      
      float distanceC = dist(contR.x, contR.y ,circleX , circleY);
      float mappedC = map(distanceC,0,rangeIn,0,realRange);
     
      
      
      double baseT = Math.toDegrees(Math.atan2(p.y,p.x));
      double baseTC =  Math.toDegrees(Math.atan2(d.y,d.x));
  
      delay(delay);
      move2axis(14 , mainY);
      delay(delay);
      moveBase(baseT);
      delay(delay);
      move2axis(mapped , mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      move2axis(mainX , objHeight);
      delay(delay);
      OCGrip(true);
      delay(delay);
      move2axis(mainX , contHeight);
      delay(delay);
      moveBase(baseTC);
      delay(delay);
      move2axis(mappedC ,mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      
    }
    

    
    
  }
  initArm();
  
  
  for(Blob b: blobsG){
    if (b.size() > refBolbSize && !b.container && b.size() < refContSize && check((int)b.getX() ,(int) b.getX())) {
      
      d.set(contG.x-circleX , -contG.y+circleY ); 
      p.set(b.getX()-circleX, -b.getY()+circleY);
      
      
      float distance = dist(b.getX() ,b.getY() ,circleX , circleY);
      float mapped = map(distance,0,rangeIn,0,realRange);
      
      float distanceC = dist(contG.x, contG.y ,circleX , circleY);
      float mappedC = map(distanceC,0,rangeIn,0,realRange);
     
      
      
      double baseT = Math.toDegrees(Math.atan2(p.y,p.x));
      double baseTC =  Math.toDegrees(Math.atan2(d.y,d.x));
  
      delay(delay);
      move2axis(14 , mainY);
      delay(delay);
      moveBase(baseT);
      delay(delay);
      move2axis(mapped , mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      move2axis(mainX , objHeight);
      delay(delay);
      OCGrip(true);
      delay(delay);
      move2axis(mainX , contHeight);
      delay(delay);
      moveBase(baseTC);
      delay(delay);
      move2axis(mappedC ,mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      
      
      
      
    }
    
    
    
    
  }
  initArm();
  
  for(Blob b: blobsB){
    if (b.size() > refBolbSize && !b.container && b.size() < refContSize && check((int)b.getX() ,(int) b.getX())) {
      
      d.set(contB.x-circleX , -contB.y+circleY ); 
      p.set(b.getX()-circleX, -b.getY()+circleY);
      
      
      float distance = dist(b.getX() ,b.getY() ,circleX , circleY);
      float mapped = map(distance,0,rangeIn,0,realRange);
      
      float distanceC = dist(contB.x, contB.y ,circleX , circleY);
      float mappedC = map(distanceC,0,rangeIn,0,realRange);
     
      
      
      double baseT = Math.toDegrees(Math.atan2(p.y,p.x));
      double baseTC =  Math.toDegrees(Math.atan2(d.y,d.x));
  
      delay(delay);
      move2axis(14 , mainY);
      delay(delay);
      moveBase(baseT);
      delay(delay);
      move2axis(mapped , mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      move2axis(mainX , objHeight);
      delay(delay);
      OCGrip(true);
      delay(delay);
      move2axis(mainX , contHeight);
      delay(delay);
      moveBase(baseTC);
      delay(delay);
      move2axis(mappedC ,mainY);
      delay(delay);
      OCGrip(false);
      delay(delay);
      
      
      
      
    }
    
    
    
  }
      initArm();

  onAction=false;

}
