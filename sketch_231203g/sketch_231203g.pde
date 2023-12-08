float bx;
float by;
int boxX = 83;
int boxY = 109;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(640, 360);
  bx = width/2.0;//起始位置
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() { 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-boxX && mouseX < bx+boxX && 
      mouseY > by-boxY && mouseY < by+boxY) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  
  // Draw the box
  for(int i=0;i<4;i++){
    rect(bx, by, boxX, boxY,7);
  }
}

void mousePressed() {
  if(overBox) { 
    locked = true; 
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
