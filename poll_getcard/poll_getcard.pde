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
  for(int i=0;i<100;i++){ //洗牌100次
    int a = int(random(53)), b = int(random(53));
    int temp = cardN[a]; //交換card
    cardN[a] = cardN[b];
    cardN[b] = temp;
    temp = cardC[a];
    cardC[a] = cardC[b];
    cardC[b] = temp;
  }
} 
//int [][] card = new int[4][13];
int [] cardN = new int[53]; //card number
int [] cardC = new int[53];//card color
color [] C = {#000000,#FF0000,#00FF00,#0000FF};
void draw(){
  background(255); 
  //if(mousePressed && mouseButton==RIGHT){//偷看全部的牌(這裡有問題啦)
    for(int i=0;i<4;i++){
      for(int j=1;j<=13;j++){//牌從1開始
        drawCard(j*83,i*109,cardC[i*13+j],cardN[i*13+j],83);
      }
    }
  /*}else drawCard(50,50,#000000,99,128); //get card here
   
   for(int i=1;i<myCard;i++){
     drawCard(430,500,cardC[i],cardN[i],128);//變大的card
   }*/
}
int myCard = 1;
/*void mousePressed(){
  if(mouseButton==LEFT) myCard++;
}//(這裡有問題啦)*/
void drawCard(int x,int y,color c,int n,int w){//w:寬度
  float s = w/83.0; //scale 縮放倍率
  stroke(128);//gray stroke
  fill(255);
  rect(x,y,83*s,109*s,10*s);
  textSize(20*s);
  fill(c);
  String rank = getRank(n);
  text(rank,x+8*s,y+20*s);
  
  pushMatrix(); // 保存當前的變換矩陣
  translate(x+75*s, y+90*s); // 將座標系移動到撲克牌的右下角
  rotate(radians(180)); // 逆時針旋轉180度
  text(rank,0,0); // 繪製下顛倒的字母或數字
  popMatrix(); // 恢復原來的變換矩陣
}
String getRank(int n){
  if(n == 1){ return "A";}
  else if(n == 11){return "J";}
  else if(n == 12){return "Q";}
  else if(n == 13){return "K";}
  else{return Integer.toString(n);}
}
