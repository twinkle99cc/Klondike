void setup(){
  size(1500,900);
}
int [][] card = new int[4][13];
color [] C = {#000000,#FF0000,#000000,#FF0000};
void draw(){
  background(255);
  for(int i=0;i<4;i++){
    for(int j=0;j<13;j++){
      drawCard(j*83, i*109 , C[i%4],j);
    }
  }
}
void drawCard(int x,int y,color c,int n){
  stroke(128);//gray stroke
  fill(255);
  rect(x,y,83,109,10);
  textSize(20);
  fill(c);
  text(n,x+10,y+20);
  /*pushMatrix(); // 保存當前的變換矩陣
  translate(x+70, y+109); // 將座標系移動到撲克牌的右下角
  rotate(radians(180)); // 逆時針旋轉180度
  text(1,10,15); // 繪製下顛倒的字母或數字
  popMatrix(); // 恢復原來的變換矩陣*/
}
