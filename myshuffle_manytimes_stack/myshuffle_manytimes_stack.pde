void setup(){
  size(1500,900);
  myshuffle();
}
void myshuffle(){
  for(int i=0;i<4;i++){
    for(int j=0;j<13;j++){
      cardN[i*13+j] = j+1;
      cardC[i*13+j] = C[i%4];
    }
  }
  for(int i=0;i<100;i++){ //洗牌100次
    int a = int(random(52)), b = int(random(52));
    int temp = cardN[a]; //交換card
    cardN[a] = cardN[b];
    cardN[b] = temp;
    temp = cardC[a];
    cardC[a] = cardC[b];
    cardC[b] = temp;
  }
} 
//int [][] card = new int[4][13];
int [] cardN = new int[100]; //card number
int [] cardC = new int[100];//card color
color [] C = {#000000,#FF0000,#00FF00,#0000FF};
void draw(){
  background(#FCF2EA);
  drawCardContainer(250 , 100);//翻出來的牌
  for(int i=0; i<4; i++){
    drawCardContainer(450+ 150*i, 100);//放牌的地方
  }
  /*for(int i=0;i<4;i++){
    for(int j=0;j<13;j++){
      //drawCard(j*83, i*109 , cardC[i%4], j);
      drawCard(j*83,i*109,cardC[i*13+j],cardN[i*13+j]);
    }
  }*/
  int startX = 405;//x起始位置
  int startY = 220;//y起始位置
  for (int i=0, index = 0; i<7; i++) {//index陣列索引值
    for (int j=0; j<7-i; j++, index++) {
      int x = startX + (j * 83) + (i * 83);
      int y = startY + (i * 50);
      drawCard(x, y, cardC[index], cardN[index]);
      //drawCard(x, y ,cardC[i*13+j],cardN[i*13+j]);
    }
  }  
}
void drawCard(int x,int y,color c,int n){
  stroke(128);//gray stroke
  fill(255);
  rect(x,y,83,109,10);
  textSize(20);
  fill(c);
  String rank = getRank(n);
  text(rank,x+8,y+20);
  
  pushMatrix(); // 保存當前的變換矩陣
  translate(x+75, y+90); // 將座標系移動到撲克牌的右下角
  rotate(radians(180)); // 逆時針旋轉180度
  text(rank,0,0); // 繪製下顛倒的字母或數字
  popMatrix(); // 恢復原來的變換矩陣*/
}
String getRank(int n){
  if(n == 1){ return "A";}
  else if(n == 11){return "J";}
  else if(n == 12){return "Q";}
  else if(n == 13){return "K";}
  else{return Integer.toString(n);}
}
void drawCardContainer(int x, int y){ //放牌的地方
  stroke(0);
  fill(255);
  rect(x, y, 83, 109, 7);
}
