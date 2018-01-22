PShape clock;
PShape base;
PShape hand1;
PShape hand2;
PShape line1;
PImage img;
int i=0;

void setup() {
  size(800, 800);
  clock=loadShape("clock.svg");
  hand1=loadShape("hand1.svg");
  hand2=loadShape("hand2.svg");
  line1= loadShape("line1.svg");
  clock.disableStyle();
  hand1.disableStyle();
  hand2.disableStyle();
  line1.disableStyle();
  base= clock.getChild("base");
  img= loadImage("img.jpg");
  frameRate(1);
  int i=0;
}

void draw() {
  //image-addition
  image(img, 0, 0, width, height);
  color c=0;
  if (i%5==0) {
    c=get(int(random(0, width)), int(random(0, height)));
    fill(c);
    println(c);
    rect(0, 0, width, height);
  }  

  //draw clock
  shape( base, 50, 50, 700, 700);
  shape( hand1, (width/2)-20, (height/2)-20);
  
//colour clock
/*if (c%2==0) {
    for (int x=0; x<360; x++) {
      shape(line1, width/2, height/2);
      line1.rotate(radians(1));
    } 
  }else {
  for (int x=0; x<360; x++) {
      shape(line1, width/2, height/2);
    } 
}*/
  

//periodic movement
translate(width/2, height/2);
rotate(radians(6*i));
shape( hand2, -30, -200);
//minute hand
if (i%5==0) {
  hand1.rotate(radians(6));
}
translate(0, 0);
i++;
}