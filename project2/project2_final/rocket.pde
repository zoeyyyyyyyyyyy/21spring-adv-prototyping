class Rocket{     //the launch sequence
  
  color c;
  float dia, x,y,beginx, beginy, endy, r, g, b;
  
 Rocket(){
  dia = 5;
  x = random(560,1160);
  y = 800;
  endy = random(360,600);
  r = random(120,250);
  g = random(120,250);
  b = random(120,250);
  c = color(r,g,b);
 } 
  
  void draw(){
   noStroke();
   fill(c); 
   ellipse(x,y,dia,dia);
   y -= 3;
  }
  
  float getX(){
   return x;
  }
  float getY(){
   return  y;
  }
  float getEnd(){
   return endy; 
  }
  color getColor(){
   return c; 
  }
  boolean reached(){
   return y < endy;
  }
  
}
