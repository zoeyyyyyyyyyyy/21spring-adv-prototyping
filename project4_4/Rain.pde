class Rain{
  int raindrops = 100;
float[] raindropX = new float[raindrops];
float[] raindropY = new float[raindrops];
float[] rainfallX = new float[raindrops];
float[] rainfallY = new float[raindrops];
float[] rainSize = new float[raindrops];
    float x = random(width);
        float y = random(height);
        float s = noise(x*0.01, y*0.01)*2;

void display(){
    for (int lop=0; lop<raindrops; lop=lop+1) {
    raindropX[lop] = width/2;
    raindropY[lop] = height/2;
    rainfallX[lop] = random(-20, 20);
    rainfallY[lop] = random(-20, 20);

    rainSize[lop] = random(1, 30);

  }
}
void run(){
    
    
   for ( int lop = 0; lop< raindrops; lop++) {
         //only Synths play then rain play
      fill(92,fftp.getBand(lop)*random(34,255),fftp.getBand(lop)*random(80,255),40);
      //ellipse,center: (rainDropX, rainDropY), size: rainSize
      ellipse( raindropX[lop], raindropY[lop], rainSize[lop], rainSize[lop]);
      raindropY[lop] = raindropY[lop] + rainfallY[lop];
      raindropX[lop] = raindropX[lop] + rainfallX[lop];
      if (raindropX[lop]<0 || raindropX[lop]>width || raindropY[lop]<0 || raindropY[lop]>height) 
      {
        raindropX[lop] = width/2;
        raindropY[lop] = height/2;
      }
      
       
      

      //click
      {
        if (mousePressed == true) {
          //Change direction
          rainfallX[lop] = rainfallX[lop]*-1;
          rainfallY[lop] = rainfallY[lop]*-1;
        }
      }

   }
}
}
