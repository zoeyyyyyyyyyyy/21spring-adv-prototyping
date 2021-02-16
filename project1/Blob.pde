class Blob{
  float t = 0;
  float k = 1.5;
  float step = 0.03;
  float n = 12; // number of blobs
  void display(){
    for (float i = 1; i < n; i++) {
    float h = abs(i/n - t/10) % 1;
    fill(h, 100, 100, 0.1);
    
    blob(3 * i, mouseX, mouseY, k, t - i*step);
    };
    t += step;
    //filter(GRAY);
    filter(INVERT);
  }
  
 void blob(float size, float xCenter, float yCenter, float k,float t) {
  beginShape();
  for (float theta = 0; theta < 2 * PI; theta += 0.01) {
    float r1, r2;
    if (theta < PI / 2) {
      r1 = cos(theta);
      r2 = 1;
    } 
    
    else if (theta < PI) {
      r1 = 0;
      r2 = sin(theta);
    } 
    
    else if (theta < 3 * PI / 2) {
      r1 = sin(theta);
      r2 = 0;
    } 
    
    else {
      r1 = 1;
      r2 = cos(theta);
    }
    float r = size + noise(k * r1, k * r2, t) * 2 * size / 5;
    float x = xCenter + r * cos(theta);
    float y = yCenter + r * sin(theta);
    curveVertex(x, y);
  }
  endShape();
}

  void keyReleased(){
      if (key == 'b' || key == 'B') { 
      n += 8;
    } else if (key == 'v' || key == 'V' && n>8 ) { 
      n -= 8;
    }
}
}
