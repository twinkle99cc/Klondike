int x = 100;
int y = 100;
int sz = 100;
color bgcolor;
 
void setup() {
  size(400, 300);
  colorMode(HSB);
  noStroke();
  smooth();
  
  fill(random(255), 100, 200);
  bgcolor = color(random(255), 150, 255);
  background(bgcolor);
}
void draw() {
  background(bgcolor);
  
  if(dist(x,y, mouseX, mouseY) < sz / 2) {/*dist()函數計算滑鼠游標和
  圓形中心點之間的距離，如果距離小於圓形半徑的一半，則將游標設置為手形，
  並且如果滑鼠左鍵被按下，則將圓形的中心點設置為滑鼠游標的位置，
  並將描邊寬度設置為5，否則描邊寬度為2。最後根據游標是否在圓形內部來繪製
  圓形的描邊。*/
    cursor(HAND);
    if(mousePressed) {
      x = mouseX;
      y = mouseY;
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
    stroke(255);
  } else {
    cursor(ARROW);
    noStroke();
  }
  for(int i=0;i<2;i++){
    ellipse(x+i*200, y, sz, sz);
  }
}
