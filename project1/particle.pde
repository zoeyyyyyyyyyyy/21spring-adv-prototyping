class Particle {
  color c;
  float incr, theta, posX, posY, dist;
  float d;

  Particle(float xIn, float yIn, color cIn) {
    posX = xIn;
    posY = yIn;
    c = cIn;
    dist = 2;
  }

  void move() {
    update();
    wrap();
    display();
  }

  void update() {
    incr +=  .008;
    theta = noise(posX * .006, posY * .004, incr) * TWO_PI;
    posX += 2 * cos(theta);
    posY += 2 * sin(theta);
  }

  void wrap() {
    if (mouseX-30 < posX && posX < mouseX+ 30
      && mouseY-30 < posY && posY < mouseY+ 30 ) {
      //float theta = 0.0; // theta = 0 to TWO_PI
      //float speed = 0.05;
      //theta += speed;
      //float posX = (mouseX-random(50,70)) * cos(theta);
      //float posY = (mouseY-random(50,70)) * sin(theta);
      //translate(posX,posY);
      d = dist(mouseX,mouseY, posX, posY);
      if(d==0)
          d=0.1;
          posX = posX - (25/d) *(mouseX - posX);
          posY = posY - (25/d) *(mouseY - posY);
      };
    if (posX < -dist) posX = width + dist;
    if (posX > width + dist ) posX =  -dist;
    if (posY < -dist ) posY = height + dist;
    if (posY > height + dist) posY =  -dist;
  }



  void display() {
    if ((posX > 0) && (posX < width) && (posY > 0) && (posY < height)) {
      //currFrame[(int)posX + ((int)posY)*width] = c;
      int currC = currFrame[(int)posX + ((int)posY)*width];
      currFrame[(int)posX + ((int)posY)*width] =  blendColor(c, currC, ADD);
    }
  }
}
