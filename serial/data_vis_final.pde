import processing.serial.*;
float theta;  

Serial port;
float val;



void setup() {
  size(920, 700);
  smooth();
  String arduinoPort = Serial.list()[0];
  port=new Serial(this, arduinoPort, 9600);
}

void draw(){
  if (port.available()>0){
val = port.read();
}

println(val);
  background(0);
  frameRate(20);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = ((val+100) / (float) (width/2)) * 70f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-150);
  // Move to the end of that line
  translate(0,-150);
  // Start the recursive branching!
  branch(200);
 
}

void branch(float val) {
  // Each branch will be 2/3rds the size of the previous one
  val *= 0.8;
   
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (val > 1) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    stroke(val+80,255,val-100);
    line(0, 0, 0, -val);  // Draw the branch
    
    translate(0, -val+10); // Move to the end of the branch
    branch(val-10);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
     
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -val);
    translate(0, -val+10);
    branch(val-10);
    popMatrix();
  }
}
 


