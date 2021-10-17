PFont f;
String info = " 这是一个长句子.";
float y = 0;

void setup(){
  size(600,400,P3D);
  f =createFont("3DSFonticon-48",24,true);
}
void draw(){
  background(255);
  fill(0);
   //textFont(f);
 // int x = 50;
  //for(int i =1;i<info.length();i++){
    //textSize(random(12,36));
    //text(info.charAt(i),x,height/2);
   // x +=textWidth(info.charAt(i));}
  
 translate(width/2,height/2);
  rotateX(20);
  textFont(f);
  textAlign(CENTER);
  text(info,0,y);
  
  y = y - 1;
}
