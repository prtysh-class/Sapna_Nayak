float a;
float i;

void setup() {
  size(1000, 1000);
  frameRate(1);
}

void draw() {
  background(255);

  //calling random number function for 1000 times
  for (float i=0; i<1000; i=i+1) {
    a = randomno();
    println (a);

    //checking for condition (no between 400 and 800)
    if (a>400 && a<800) {
      line(a, i);
    }
  }
}

//function uses 2 random numbers generated and uses their relation to decide value of new random number
float randomno() {  
  float x= random(0, 5000);
  float y= random(0, 5000);
  if ((x%y)<20 ) {
    float no=x/y;
    return no;
  } else {
    float no=(x/y)+(x-y);
    return no;
  }
}

//function takes value of random number and uses it for the line y value and maps it to darkness of stroke
void line(float y, float x) {
  float c=map(y, 400, 800, 0, 255);
  stroke(c);
  line(x, (height-y), x, height );
}