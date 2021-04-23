class Circle {
  PVector loc;
  float radius;
  color c;
  Circle(PVector _loc, float _radius) {
    loc = _loc;
    radius = _radius;
    c = lerpColor(c1,c2,sq(loc.mag()/250));
  }
  void display() {
    fill(c,60);
    if ( c == 255){
      c -= sq(loc.mag()/250);
    }
    
    noStroke();
    float r = time > duration ? radius : easeOutElastic(time,0,radius,duration);
    if(Leah1.getGain()> 0) {
      if (now%2 == 0)
    ellipse(loc.x, loc.y, r*2+12*fft1.getBand(0), r* 2 +12*fft1.getBand(0));
    else
    rect(loc.x, loc.y, r*2+12*fft1.getBand(0), r*2 +12*fft1.getBand(0));
    }
    
  }
  float easeOutElastic(float t, float b, float c, float d) {
    float s = 1.70158;
    float a = c;
    if (t == 0)
    return b;
    if(t==1)
    return b+c;
    float p=d*0.3;
    if(a<abs(c)) {
      a=c;
      s=p/4;
    } else {
      s = p/(2*PI) * asin(c/a);
    }
    return a* pow(2,-10 *t) * sin((t*d -s) * (2*PI) / p) +c +b;
  }
}
