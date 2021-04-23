


class Cube {
  int w = 40;
  int h = 40;
  float xMax, yMax;
  float colorA, colorB;
  float noiseScale = 0.1;

  IntList palette;





  void display() {
    xMax = width / w;
    yMax = height / h;


    palette = new IntList();
    //palette.append(#6AFBD0);
    //palette.append(#0AA18B);
    //palette.append(#0B6C62);
    //palette.append(#062C2E);
    palette.append(#105BFB);
    palette.append(#430AA1);
    palette.append(#6A79FB);
    palette.append(#745EFF);
    palette.append(#0C062E);
    

    noStroke();
    for (int i = 0; i < xMax; i++) {
      for (int j = 0; j < yMax; j++) {
        float n = noise(i * noiseScale, j * noiseScale, frameCount * noiseScale * 0.1);

        int s = palette.size();
        int m = floor((n * 10) % s);
        //print(m);
        int c = palette.get(m);
        //print(palette);
        fill(c, 80);
        rect(i * w, j * h, w, h);
      }
    }
  }
}
