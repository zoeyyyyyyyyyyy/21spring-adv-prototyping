class Particles{       //Partilces from the explosion
  
 float x,y,dia,dis;
 color c;
 
 Particles(float xx, float yy, color col){
  x = xx;
  y = yy;
  dia = 3;
  c = col;
  dis = 6;
 } 
 
 void draw(){
   noStroke();
   fill(c);
   ellipse(x,y,dia,dia);
 }
 
 float getDist(){
   return dis;
 }
 
}
