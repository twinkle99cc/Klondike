void setup(){
  size(1500,900);
}
int [][] card = new int[4][13];
color [] C = {#000000,#FF0000,#000000,#FF0000};
void draw(){
  background(255);
    for(int i=1;i<=4;i++){
      for(int j=1;j<=13;j++){
        drawCard(j*83,i*109,C[(i-1)%4],j);
      }
    }
}
void drawCard(int x,int y, color c,int n){
  stroke(128);//gray stroke
  fill(255);//white
  rect(x,y,83,109);
  //noStroke();
  /*fill(c);
  rect(x+3,y+3,83-5,109-5,4);*/   
  textSize(20);fill(c);
  String rank = getRank(n);
  text(rank,x+5,y+22);
  
  pushMatrix(); // 保存當前的變換矩陣
  translate(x+70, y+109); // 將座標系移動到撲克牌的右下角
  rotate(PI); // 逆時針旋轉180度
  text(rank, -10,15 ); // 繪製下顛倒的字母或數字
  popMatrix(); // 恢復原來的變換矩陣
  }
String getRank(int n){
  if(n == 1){ return "A";}
  else if(n == 11){return "J";}
  else if(n == 12){return "Q";}
  else if(n == 13){return "K";}
  else{return Integer.toString(n);}
}
