import processing.serial.*;
Serial myConnection;
String inString = "";
int n = 10;
float AccY, AccX, AccZ, stretch;
int circlesize = 50;


void setup() {
  size(600,600);
  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[0], 9600); 
  myConnection.bufferUntil(n);
  
}

void draw() {
  background(0);
  
  translate(width/2, 0);
  noStroke();

  push();
  translate(0, 100);
  fill(16,79,35);
  ellipse(AccY, 0, 20, 20);
  pop();
  push();
  translate(0, 200);
  fill(24, 170,200);
  ellipse(AccX, 0, 20, 20);
  pop();
  push();
  translate(0, 300);
  fill(200,34,190);
  ellipse(AccZ, 0, 20, 20);
  pop();
}

void serialEvent(Serial conn) { 
  String fromSerial = conn.readString(); 
  

  if (inString != null) {
    String[] data = split(trim(fromSerial), ":");
    if (data.length == 4) {    
      
      AccY = map(float(data[1]), 9000, -16000, -width/2, width/2);
      AccX = map(float(data[2]), 10000, -10000, -width/2, width/2);
      AccZ = map(float(data[3]), -15500, 16700, 0, width/2);
    }
  }
}
