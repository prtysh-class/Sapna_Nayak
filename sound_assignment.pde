import processing.sound.*;
Reverb reverb;
SinOsc sin1;
float i=0.2;
float j=200;
float C;
AudioIn in;
Amplitude amp;
float x;
float x1;
float incr;

void setup() {
  size(640, 360);
  background(0);

  //initializing amplitude, input, sinosc and reverb variables
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  reverb= new Reverb(this);
  sin1= new SinOsc(this);

  //C note frequency value
  C= 440;
}

void draw() {
  //drawing reference lines for checking
  stroke(255);
  line(0, height/2, width, height/2);
  line(width/4, 0, width/4, height);
  line(width/2, 0, width/2, height);
  line(3*width/4, 0, 3*width/4, height);

  //using amp.analyze value scaled up to determine whether it should move
  x=10000*amp.analyze();

  if (x>150 ) {
    incr=incr+1;
    stroke(0);
    ellipse(incr, height/2, 20, 20);
  }

  sin1.freq(C);

  if (incr>width/4 && incr<3*width/4 ) {
    if(incr>width/2){
      reverb.process(sin1);
    }
    sin1.play();
  }

  if (incr>3*width/4) {
    sin1.stop();
  }
}