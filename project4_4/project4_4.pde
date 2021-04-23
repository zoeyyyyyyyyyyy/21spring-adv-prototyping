
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.ugens.*;


Minim minim;  
AudioPlayer jingle, Beat, Leah1, Leah2, Synths, Piano, Bass;
FFT fftb, fft1, fft2, ffts, fftp, fftba;

Rain rain = new Rain();
Net net = new Net();
Cube cube = new Cube();
Wave wave = new Wave();
float time = 0;
float duration = 200;
ArrayList<Circle> circles;

color c1, c2;
int now = 0;
int noww = 0;
float r=0, g=0, b=0;
int flag = 0;
int samples = 30;
PFont font;
static final int FADE = 1;


void setup()
{
  fullScreen();
  //size(1520,1080,P3D);
  


  minim = new Minim(this);  
  Beat = minim.loadFile("Beat.wav", 1024);
  Leah1 = minim.loadFile("Leah1.wav", 1024);
  Leah2 = minim.loadFile("Leah2.wav", 1024);
  Synths = minim.loadFile("Synths.wav", 1024);
  Piano = minim.loadFile("Piano.wav", 1024);
  Bass = minim.loadFile("Bass.wav", 1024);



  fftb = new FFT( Beat.bufferSize(), Beat.sampleRate() );
  fft1 = new FFT( Leah1.bufferSize(), Leah1.sampleRate() );
  fft2 = new FFT( Leah2.bufferSize(), Leah2.sampleRate() );
  ffts = new FFT( Synths.bufferSize(), Synths.sampleRate() );
  fftp = new FFT( Piano.bufferSize(), Piano.sampleRate() );
  fftba = new FFT( Bass.bufferSize(), Bass.sampleRate() );

  
  rectMode(CENTER);
  rain.display();
  font = createFont("MonumentExtended-Regular.otf",32);


}

void keyPressed() {
  if (key == '1') {
    if (Beat.getGain() <= 0) {
      Beat.shiftGain(Beat.getGain(), +40, FADE);
    } else {
      Beat.shiftGain(Beat.getGain(), -40, FADE);
    }
  }

  if (key == '2') {
    if (Leah1.getGain() <= 0) {
      Leah1.shiftGain(Leah1.getGain(), +40, FADE);
    } else {
      Leah1.shiftGain(Leah1.getGain(), -40, FADE);
    }
  }

  if (key == '3') {
    if (Leah2.getGain() <= 0) {
      Leah2.shiftGain(Leah2.getGain(), +40, FADE);
    } else {
      Leah2.shiftGain(Leah2.getGain(), -40, FADE);
    }
  }

  if (key == '4') {
    if (Synths.getGain() <= 0) {
      Synths.shiftGain(Synths.getGain(), +1, FADE);
    } else {
      Synths.shiftGain(Synths.getGain(), -1, FADE);
    }
  }

  if (key == '5') {
    if (Piano.getGain() <= 0) {
      Piano.shiftGain(Piano.getGain(), +80, FADE);
    } else {
      Piano.shiftGain(Piano.getGain(), -80, FADE);
    }
  }

  if (key == '6') {
    if (Bass.getGain() <= 0) {
      Bass.shiftGain(Bass.getGain(), +80, FADE);
    } else {
      Bass.shiftGain(Bass.getGain(), -80, FADE);
    }
  }
}


void draw() {
  if (noww == 0) {
    background(16, 91, 251);
  textFont(font);
  //textSize( 18 );
    text("Press 1-6 to get different music tracks", width/2-340, height/2);
    //!!!初始屏幕！！！
  }
  if (noww == 4) {
    //if(flag ==0) {
    //  background(0);
    //} else {
    //  background(255);
    //}
    background(0);
    
    if(Beat.getGain()>0) {
    cube.display();
    }
    
    noFill();
    if(Bass.getGain()>0) {
    wave.display();
    }
    noStroke();
    

    
    colorMode(RGB,80);
    if(Piano.getGain()>0) {
    rain.run();
    }
    noFill();
    
    //colorMode(HSB,255);
    //if(Piano.getGain()>0) {
    //dis.display();
    //}
    //colorMode(RGB, 100);

    noFill();
    strokeWeight(4);
    translate(width / 2, height / 2);
    if(Leah2.getGain()>0) {
    net.display();
    }
    translate(-width / 2, -height / 2);
    noStroke();
    //fill(random(48,255),random(12,255),random(78,255));

    
    //cricle color setup
    noStroke();
    if (mouseX < 300) {
      fill(169, 151, mouseX/4+119, 100);
    } else if (mouseX<600) {
      fill(37, 245, mouseX/4+475, 100);
    } else {
      fill(0, 221, mouseX/4, 100);
    }
    

    

  
  
  
  fftb.forward(Beat.mix);
  ffts.forward(Synths.mix);
  fft1.forward(Leah1.mix);
  fft2.forward(Leah2.mix);
  fftba.forward(Bass.mix);
  fftp.forward(Piano.mix);
  //这里关联光谱
  
  if(Synths.getGain()> 0){
  pushMatrix();
  
  for(int i=0; i<fftb.specSize(); i++) {
    //translate(width/2,height/2);
    //rotate(1.8*PI/fftb.specSize());
    //translate(-width/2,-height/2);
    //rect(460,300,13, -fftb.getBand(i)*1.2);
    //rect(320,590,6, -fftb.getBand(i)*1.5);
    translate(width/2,height/2);
    rotate(2*PI/ffts.specSize());
    translate(-width/2,-height/2);
    rect(320,590,6, -ffts.getBand(i)*1.5);
  }
  popMatrix();
  
  }
  
  colorMode(RGB,80);
  translate(width/2,height/2);
  for(Circle c : circles) {
    c.display();
  }
  
  time +=1;
} 
if(Leah2.getGain()> 0){
float spectrum = fft2.specSize();
float rectWidth = width / spectrum;
  fill(255);
  for (int i = 0; i < fft2.specSize(); i++) {
    float rectHeight = fft2.getBand(i) * 2.5;
    rect(i * rectWidth, height, rectWidth - 2, -rectHeight);
  }
}
  
}

void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
  c1 = color(random(255),random(255),random(255));
  c2 = color(random(255),random(255),random(255));
  
  circles = new ArrayList<Circle>();
  for(int i = 0; i<10000; i++) {
    float locSize = map(sqrt(random(1)),0,1,0,250);
    float locAng = random(TWO_PI);
    PVector loc = new PVector(locSize * cos(locAng), locSize * sin(locAng) );
    float radius = random (2,30);
    boolean isOverlapped = false;
    for(Circle other : circles) {
      if (PVector.dist(loc,other.loc) < (radius + other.radius) *1.4) {
        isOverlapped = true;
        continue;
      }
    }
    if (!isOverlapped) {
      circles.add(new Circle(loc,radius));
    }
  }
  now++;
  
  if(noww == 0) {
    noww = 4;
    Beat.loop();
    Leah1.loop();
    Leah2.loop();
    Piano.loop();
    Bass.loop();
    Synths.loop();
    
    Piano.shiftGain(Piano.getGain(), -80, FADE);
    Bass.shiftGain(Piano.getGain(), -80, FADE);
    Leah2.shiftGain(Piano.getGain(), -80, FADE);
    Leah1.shiftGain(Piano.getGain(), -80, FADE);
    Beat.shiftGain(Piano.getGain(), -80, FADE);
    Synths.shiftGain(Piano.getGain(), -80, FADE);
  }
  flag = 0;
}
