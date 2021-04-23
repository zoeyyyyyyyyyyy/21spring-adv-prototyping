class Explosion{        //Explosion phase of fireworks
  
  ArrayList<Particles> particle;
  float x,y,xa,ya,dis,fin;
  color col;
  
  Explosion(float xx, float yy, color c){
    particle = new ArrayList<Particles>();
    x = xx;
    y = yy;
    col = c;
    dis = 0;
    fin = random(45,60);
  }
  
  void draw(){
    for(int a = 0; a < 360; a += 12){
      xa = sin(radians(a))*dis;
      ya = cos(radians(a))*dis;      
      particle.add(new Particles(x+xa,y+ya,col));      
    } 
    for(int p = 0; p < particle.size(); p ++){
      Particles part = particle.get(p);
      part.draw();
      particle.remove(p);
    }
    dis++;
  }
  
  boolean over(){
    return dis > fin;
  }
  
}
