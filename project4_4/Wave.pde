class Wave{
  int samples = 20;
  
  void display(){

  beginShape();
  for(int i = 0; i < samples; i++){
    stroke(fftba.getBand(i)+61,84,251,i*8);
    
    strokeWeight(random(6));
    
    
 
    vertex(
    
      random(map(fftba.getBand(i)*0.5, 30, 20, 0, height)),
      random(map(i, 0, samples, 0, width)) 
    );
   if(fftba.getBand(i) <= 0) {
     stroke(0,0,0,0);
     strokeWeight(0);
   }
  }
  endShape();
  }
}
