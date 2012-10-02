int numFly=2000;

import de.looksgood.ani.*;


float x = 256;
float y = 256;

Ani aniX;
Ani aniY;



Fly[]flyFlys=new Fly[numFly];

void setup() {
  size(1000, 1000);
  smooth();
  noStroke();

  // you have to call always Ani.init() first!
  Ani.init(this);


  for (int i=0; i<numFly;i++) {
    flyFlys[i]=new Fly(random(0.5, 1), random(-width, width), random(-height, height), 3,50);
  }
}


void draw() {
  background(0);
//  fill(0, 255, 255);
//  ellipse(x, y, 120, 120);
  for (int i=0; i<numFly; i++) {
    flyFlys[i].display();
  }
}


void mouseReleased() {
  // animate the variables x and y in 1.5 sec to mouse click position
//  Ani.to(this, 1.5, "x", mouseX);
//  Ani.to(this, 1.5, "y", mouseY);
  for (int i=0; i<numFly; i++) {
    flyFlys[i].lib();
  }
}

