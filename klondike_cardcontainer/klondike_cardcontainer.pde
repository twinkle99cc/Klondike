void setup(){
  size(1500,900);
}
void draw(){
  background(#FCF2EA);
  drawCardContainer(250 , 100);//翻出來的牌
  for(int i=0; i<4; i++){
    drawCardContainer(500 + 150*i, 100);//放牌的地方
  }
}
void drawCardContainer(int x, int y){ //放牌的地方
  stroke(0);
  fill(255);
  rect(x, y, 83, 109, 7);
}
