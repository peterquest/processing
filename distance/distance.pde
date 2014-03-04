import processing.serial.*;

Serial port;
String sPort;
//int sData;
float sample;
ArrayList data = new ArrayList();

void setup() {
size(500,500);
frameRate(24);
for (int i=0; i<Serial.list().length; i++) {
  sPort = Serial.list()[i];
  if (sPort.contains("ttyACM0")) {
    port = new Serial(this, sPort, 9600);
  }
}

}

void draw() {
 if (port.available()>0) {
   
   int wat = port.read();
   data.add(wat);
   
   if (data.size() > 5) {
     data.remove(0); //only keep 5 data points in our list
   }
 }
   sample = getSample();
   background(sample*3);
   ellipse(width/2, height/2, sample*2, sample*2);
 }

float getSample() {
  float avg = 0;
  int datum;
  for (int i=0; i<data.size(); i++) {
    datum = (Integer) data.get(i); //had to cast to Integer
    avg = avg + datum;             // instead of int. ok.
  }
  
  return avg/5; // not the clearest code. but u get it. (right?)
}
