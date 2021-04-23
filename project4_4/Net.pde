float t, x, y;
float change = 0;

class Net{
 
void display() {
    
    stroke(color(random(205, 255), random(105, 255), random(20, 255)), 80);
    
    beginShape();
    for (int i = 0; i < fft2.specSize(); i++) {
        float ang = map(i*3, 2920, 2200, 0, 2*PI);
        float rad = 800 * noise(fft2.getBand(i)*2, change * 0.005);
        x = rad * sin(ang);
        y = rad * cos(ang);
        curveVertex(x, y);
    }
    endShape(CLOSE);

    change += 10;


}
}
