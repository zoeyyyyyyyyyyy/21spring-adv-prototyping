PImage daybg, day, sun, night, nightbg, frame;
int sunX=1160;
int sunY=260;
int n=5;
ArrayList<Explosion> explosion;
ArrayList<Rocket> rocket;

void setup() {
  // Images must be in the "data" directory to load correctly
  size(1600, 1080);
  daybg = loadImage("daybg.png");
  day = loadImage("day.png");
  night = loadImage("night.png");
  nightbg = loadImage("nightbg.png");
  sun = loadImage("sun.png");
  frame = loadImage("frame.png");

  explosion = new ArrayList<Explosion>();
  rocket = new ArrayList<Rocket>();
  smooth();
}

void draw() {

  background(0);
  if ( sunX<=1160 && sunX>820 ) {
    sunX = sunX - 6;
    sunY = sunY + 6;

    //day
    image(daybg, 430, 280, 832, 539);
    //sun
    image(sun, sunX, sunY, 120, 120);
    image(day, 430, 422, 834, 397);
  } else {
    //night
    //fill(255);
    //rect(430, 280, 832, 539);
    fill(37, 36, 49, 15);
    rect(430, 280, 832, 539);
    image(nightbg, 430, 280, 832, 539);
    launch();
    setRocket();
    explode();
    
    image(night, 430, 422, 834, 397);         
    

  }
  //frame
  image(frame, 430, 280, 836, 539);

  //fill(255);
  //ellipse(1160,260,10,10);
  //fill(10,0,248);
  //ellipse(860,660,10,10);
}

void keyPressed() {

  if (key == 'a') {
    print('n');
    sunX=1160;
    sunY=260;
    
    //if (sunX<=1160 && sunX>=860) {
    //  print('b');
    //  sunX = sunX - n;
    //  sunY = sunY + n;

    //} else {
    //  sunX = 1160;
    //  sunY = 260;
    //}
  }
}


void setRocket(){      //add rockets every 40 frames
if(keyPressed == true){
  if(key == CODED){
    if (keyCode == UP) {
    rocket.add(new Rocket());
    } else{
      
    }
  }
}
}

void launch(){        //launch rockets then let them explode
  for(int r = 0; r < rocket.size(); r++){
    Rocket roc = rocket.get(r);
    roc.draw();
    if(roc.reached()){
      explosion.add(new Explosion(roc.getX(),roc.getY(),roc.getColor()));
      rocket.remove(r);
    }
  }
}

void explode(){    //explode once rocket reaches its height, then disappear after a short while
  for(int e = 0; e < explosion.size(); e++){
    Explosion ex = explosion.get(e);
    ex.draw();
    if(ex.over()){
      explosion.remove(e);
    }
  }
  
}
