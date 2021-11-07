void setup(){

  size(480,480);
  frameRate(4);
  background(255);
  }

void draw(){

  int x=(int)random(12); 
  int y=(int)random(12);
  color[] colorFill={#fff4d1, #049ebb, #ff5c82, #08e0ec, #0a4578, #fae75e, #fda66f, #b285a3};

  int a=(int)random(colorFill.length);
  color rectColor=colorFill[a];
  
  fill(rectColor);
  noStroke();
  rect(x*40,y*40, 160,160);
  
  int cor1=(int)random(8);
  color corColor1=colorFill[cor1];
  int cor2=(int)random(8);
  color corColor2=colorFill[cor2];
  int cor3=(int)random(8);
  color corColor3=colorFill[cor3];
  int cor4=(int)random(8);
  color corColor4=colorFill[cor4];
  
  pushMatrix();
  translate(x*40,y*40); 
  
  fill(corColor1);
  triangle(0, 0, 0, 40, 40, 0);
  fill(corColor2);
  triangle(3*40, 0, 4*40, 0, 4*40, 40);
  fill(corColor3);
  triangle(0, 3*40, 0, 4*40, 40, 4*40);
  fill(corColor4);
  triangle(4*40, 3*40, 4*40, 4*40, 3*40, 4*40);
  popMatrix();

  }
