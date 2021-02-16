

ImgProc imgProc;
Particle[] particles;
Blob blob = new Blob();

int num = 11000;
boolean isBlue = true;

int[] currFrame;
int[] prevFrame;
int[] tempFrame;

void setup() { 
  size(1024, 600);
  colorMode(HSB, 1);
  background(0,0,0,0.5);
  frameRate(40);
  imgProc = new ImgProc();
  particles = new Particle[num];

  currFrame = new int[width*height];
  prevFrame = new int[width*height];
  tempFrame = new int[width*height];

  setParticles();
}

void draw() {  
  colorMode(HSB, 1);
  imgProc.blur(prevFrame, tempFrame, width, height);// prev is reset from current (below)
  imgProc.scaleBrightness(tempFrame, tempFrame, width, height, .99999);
  arrayCopy(tempFrame, currFrame); // from left one to right one

    for (int i=0; i<particles.length; i++) {
    particles[i].move();
  }  

  imgProc.loadAndDisplayPixelArray(currFrame, width, height);
  arrayCopy(currFrame, prevFrame);// reset prev for next time through
  
  colorMode(HSB, 1);
  noFill();
  noStroke();
  blob.display();
}


void setParticles() {
  background(0,0,0);
  for (int i=100; i<width*height; i++) {
    currFrame[i] = color(i*0, 0, 0);
    prevFrame[i] = color(0, i*0, 0);
    tempFrame[i] = color(0, 0, 0);
  }
  float r = random(255,45);
  float b = random(255,123);
  for (int i = 0; i < num; i++) { 
    float x = random( width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
    int c;
    if (isBlue) c = color(random(40, adj));
    else  c = color(r, adj, b);

    particles[i]= new Particle(x, y, c);
  }

}

void mousePressed() {
  if (mouseButton == LEFT) {
    isBlue = true;
  }
  if (mouseButton == RIGHT) {
    isBlue = false;
  }
  setParticles();
}


// Image processing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class ImgProc {

  void loadAndDisplayPixelArray(int[] src, int w, int h) {  
    loadPixels();
    for (int i=0; i<w*h; i++) {
      pixels[i] = src[i];
    }
    updatePixels();
  }

  void blur(int[] src, int[] dst, int w, int h) {
    int c, r, g, b;
    for (int y = 1; y < h-1; y++) {
      for (int x = 1; x < w-1; x++) {      
        r = g = b = 0;
        for (int yb= -1; yb <= 1; yb++) {
          for (int xb= -1; xb <= 1; xb++) {
            c = src[(x+xb)+(y-yb)*w];      
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += (c) & 0xFF;
          }
        }      
        r /= 9;
        g /= 9;
        b /= 9;
        dst[x + y*w] = 0xFF000000 | (r << 16) | (g << 8) | b;
      }
    }
  }

  void scaleBrightness(int[] src, int[] dst, int w, int h, float s) {
    int c, r, g, b;
    for (int y=0; y<h; y++) {
      for (int x=0; x<w; x++) {
        c = src[x + y*w];
        r = (int)(s * ((c >> 16) & 0xFF));
        g = (int)(s *((c >> 8) & 0xFF));
        b = (int)(s *((c) & 0xFF));      
        dst[x + y*w] = 0xFF000000 | (r << 16) | (g << 8) | b;
      }
    }
  }


  void scaleBrightness2(int[] src, int[] dst, int w, int h, float s) {
    int r;
    int g;
    int b;
    int c;
    int a;
    float as = s;
    s = 1.0;
    for (int y=0; y<h; y++) {
      for (int x=0; x<w; x++) {
        c = src[x + y*w];
        a = (int)(as *((c >> 24) & 0xFF));
        r = (int)(s * ((c >> 16) & 0xFF));
        g = (int)(s *((c >> 8) & 0xFF));
        b = (int)(s *((c) & 0xFF));      
        dst[x + y*w] = (a << 24) | (r << 16) | (g << 8) | b;
        //ch = hue(c);
        //cs = saturation(c);
        //cb = brightness(c) * s;
        //dst[x + y*w] = color(ch, cs, cb);
        //dst[x + y*w] = src[x + y*w];
      }
    }
  }
}


// particles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
