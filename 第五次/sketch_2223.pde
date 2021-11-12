//boolean bgc=false;
int bs_color=0;
int bs_shape=0;
float bs_size=0.5;
boolean eraser=false;
color black=#011627;
color pink=#F71735;
color green=#41EAD4;
color xx=#ebf94d;
color blue=#1D5AE7;
color white=#FDFFFC;
color brush;
float speed = 0;
float easing = 0.07;

void setup(){
  size(800,800);
  background(white);
  
}

void draw(){
  noStroke();
  bsColor();
  bsShape();
  eraser();
  bsSize();
  if(mousePressed&&(!(mouseX<200&&mouseX>50&&mouseY<200&&mouseY>150))&&(!(mouseX<200&&mouseX>50&&mouseY<300&&mouseY>250))&&(!(mouseX<200&&mouseX>50&&mouseY<400&&mouseY>350))){
    float target = dist(mouseX, mouseY, pmouseX, pmouseY);
    speed += (target - speed) * easing;
    if(bs_shape%2==0){
      stroke(red(brush)+speed,green(brush)+speed,blue(brush)+speed);
      if(eraser) stroke(white);
      strokeWeight(speed/2*bs_size);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
 
    
    if(bs_shape%2==1){
      for(int x=mouseX-int(speed/2*bs_size);x<mouseX+int(speed/2*bs_size);x++){
        for(int y=mouseY-int(speed/2*bs_size);y<mouseY+int(speed/2*bs_size);y++){
          color c;
          if(eraser)  c=white;
          else c=color(red(brush)+x-mouseX+50,green(brush)+y-mouseY+50,blue(brush)+50);
          set(x,y,c);
          fill(c);
          line(mouseX, mouseY, pmouseX, pmouseY);
        }
      }
    }
  }
}
void mouseClicked(){
  if(mouseX<200&&mouseX>50&&mouseY<200&&mouseY>150){
    bs_color+=1;
    fill(white);
    rect(50,150,150,50);
  }
  if(bs_color%4==0)  brush=black;
  if(bs_color%4==1)  brush=pink;
  if(bs_color%4==2)  brush=blue;
  if(bs_color%4==3)  brush=xx;

  
  if(mouseX<200&&mouseX>50&&mouseY<300&&mouseY>250){
    bs_shape+=1;
    fill(white);
    rect(50,250,150,50);
  }
  
  if(mouseX<200&&mouseX>50&&mouseY<400&&mouseY>350){
    if(eraser) eraser=false;
    else eraser=true;
    fill(white);
    rect(50,350,150,50);
  }
}

void bsColor(){
  fill(blue);
  rect(50,150,150,50);
  fill(white);
  textSize(30);
  text("color",95,184);
  if(bs_color%4==0)  brush=black;
  if(bs_color%4==1)  brush=pink;
  if(bs_color%4==2)  brush=blue;
  if(bs_color%4==3)  brush=xx;
 
}

void bsShape(){
  fill(blue);
  rect(50,250,150,50);
  fill(white);
  textSize(30);
  text("shape",88,283);
}

void eraser(){
  fill(pink);
  rect(50,350,150,50);
  fill(white);
  textSize(30);
  if(eraser) text("painter",81,383);
  else text("eraser",86,383);
}

void bsSize(){
  if(key==CODED&&keyCode==UP)  bs_size+=0.01;
  if(key==CODED&&keyCode==DOWN)  bs_size-=0.01;
  if(bs_size==0||bs_size==2)  bs_size=0.5;
}
