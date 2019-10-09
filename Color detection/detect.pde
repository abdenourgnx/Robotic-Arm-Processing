

void detect(color trackColor , ArrayList<Blob> blobs , String clr){
  
  video.loadPixels();
  blobs.clear();  


  
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
       
      if ( check(x,y)){
        
        int loc = x + y * video.width;
        // What is current color
        color currentColor = video.pixels[loc];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
  
        float d = distSq(r1, g1, b1, r2, g2, b2); 
  
        if (d < threshold*threshold) {
  
          boolean found = false;
          
          for (Blob b : blobs) {
            if (b.isNear(x, y)) {
              b.add(x, y);
              found = true;
              break;
            }
          }
  
          if (!found) {
            Blob b = new Blob(x, y);
            blobs.add(b);
          }
        }
      }
            
    }
  }
  
  

  for (Blob b : blobs) {
    if (b.size() > refBolbSize && b.size() <refContSize) {
       b.show(clr);
      }
  }
  
}


float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}


float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

boolean check(int x , int y ){
  
  if( (x > width/2 + rangeIn/4 && x < width/2 -rangeIn/4) ) {
    return true;
  }else{
    return true ;
  }
}
