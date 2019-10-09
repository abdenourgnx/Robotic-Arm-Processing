



void calculateSizes(){
   rSize =0;
   gSize = 0;
   bSize= 0;
   
   for(Blob b : blobsR){
      if (b.size() > refBolbSize && !b.container && b.size()< refContSize) {
         rSize++;
      }
     
   }  
  
  for(Blob b : blobsG){
    if (b.size() > refBolbSize && !b.container && b.size()< refContSize) {
      gSize++;
    }
   
  }
  
  for(Blob b : blobsB){
    if (b.size() > refBolbSize && !b.container && b.size()< refContSize) {
       bSize++;
    }
   
  }

}




void showFinish(){
  
  textSize(50);
  fill(0);
  stroke(255,0,0);
  text("Finish",width/2 ,height/2);
  
  delay(3000);
  
}
