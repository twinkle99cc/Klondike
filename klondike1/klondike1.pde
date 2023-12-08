void setup(){
  size(1500,900);
  myShuffle();
}
void myShuffle(){
  for(int i=1;i<4;i++){
    for(int j=1;j<13;j++){
      cardN[i*13+j] = j;
      cardC[i*13+j] = C[i%4];
    }
  }
  for(int i=0;i<10000;i++){
  int a = int(random(52)), b = int(random(52));
  int temp = cardN[a];
  cardN[a] = cardN[b];
  cardN[b] = temp;
  temp = cardC[a];
  cardC[a] = cardC[b];
  cardC[b] = temp;
  }
}
int [][] card = new int[4][13];
int [] cardN = new int[52];//card number
int []cardC = new int[52];//card color
color [] C = {#000000,#FF0000,#000000,#FF0000};//花色順序錯
void draw(){
  background(255);
  if(mousePressed && mouseButton==RIGHT){ //cheat key,peek all
    for(int i=0;i<4;i++){
       for(int j=0;j<13;j++){
         //drawCard(j*32,i*50,C[i%4],j);
         drawCard(j*83,i*109,cardC[i*13+j],cardN[i*13+j],83);
       }
    }
  }else drawCard(109,109,#000000,99,128);//取牌的地方 get card here
  for(int i=0;i<myCard;i++){ //改發牌位置
    if(i%4==0) drawCard(430 +40*i/4,50,cardC[i],cardN[i],128);
    if(i%4==1) drawCard(630 +40*i/4,350,cardC[i],cardN[i],128);
    if(i%4==2) drawCard(430 +40*i/4,650,cardC[i],cardN[i],128);
    if(i%4==3) drawCard(230 +40*i/4,350,cardC[i],cardN[i],128);
  }
}
int myCard = 0;
void mousePressed(){
  if(mouseButton==LEFT) myCard++;
}
void drawCard(int x,int y, color c,int n,int w){
  stroke(128);//gray stroke
  fill(255);//white
  rect(x,y,83,109,7);
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
