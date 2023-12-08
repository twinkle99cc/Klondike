void setup(){
  size(1500,900);
  myshuffle();
}
void myshuffle(){
  for(int i=0;i<4;i++){
    for(int j=1;j<=13;j++){
      cardN[i*13+j] = j;
      cardC[i*13+j] = C[i%4];
    }
  }
  int r1 = int(random(1,53)), r2 = int(random(1,53));
  int temp = cardN[r1]; //交換card
  cardN[r1] = cardN[r2];
  cardN[r2] = temp;
  temp = cardC[r1];
  cardC[r1] = cardC[r2];
  cardC[r2] = temp;
} 
//int [][] card = new int[4][13];
int [] cardN = new int[53]; //card number
int [] cardC = new int[53];//card color
color [] C = {#000000,#FF0000,#00FF00,#0000FF};
void draw(){
  background(255);
  for(int i=0;i<4;i++){
    for(int j=1;j<=13;j++){//牌從1開始
      //drawCard(j*83, i*109 , cardC[i%4], j);
      drawCard(j*83,i*109,cardC[i*13+j],cardN[i*13+j]);
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
