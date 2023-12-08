void setup(){
  size(1500,900);
}
int [][] card = new int[4][13];
color [] C = {#000000,#FF0000,#000000,#FF0000};
void draw(){
  background(255);
  for(int i=0;i<4;i++){
    for(int j=0;j<13;j++){
      drawCard(j*83, i*109 , C[i%4]);
    }
  }
}
void drawCard(int x,int y,color c){
  stroke(128);//gray stroke
  fill(255);
  rect(x,y,83,109,10);
}
