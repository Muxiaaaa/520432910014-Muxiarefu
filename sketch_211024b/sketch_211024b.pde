int boxSize = 70;
Ball[] balls = new Ball[7]; 
void setup(){
  size(700,700);

  background(255);
  for(int i=0; i<balls.length; i++){
    balls[i] = new Ball(random(20,width-10),random(20,height/2),random(10,20), 2.0);
  }
  
}
void draw(){
  background(200);
  rect(50,100,boxSize,boxSize);

  if(mouseX <100){
    cursor(ARROW);
  }else if(mouseX >= 100 && mouseX < 200){
    cursor(CROSS);
  } else if(mouseX >= 200 && mouseX < 300){
    cursor(HAND);
  }else if(mouseX >= 300 && mouseX < 400){
    cursor(MOVE);
  }else if(mouseX >= 400 && mouseX < 500){
    cursor(TEXT);
  }else {
    cursor(WAIT);
  }

  for(int i=0; i<balls.length; i++){
    balls[i].constrained();
    balls[i].update();
    balls[i].display();
  }
  if (mousePressed){
    fill(mouseX,mouseY,0);
    for(int i=0; i<balls.length; i++){
      if (pow(mouseX-balls[i].x,2)+pow(mouseY-balls[i].y,2) < pow(balls[i].D/2,2)){
        balls[i].unfreeze();
        break;
      }
    }
  }
  
}
class Ball{
  float x,y;
  float D;
  float dy;
  boolean frozen;
  Ball(float x_, float y_, float D_, float dy_){
    x = x_;
    y = y_;
    D = D_;
    dy = dy_;
    frozen=true;
  }
  void unfreeze(){
    frozen = false;
  }
  void freeze(){
    frozen = true;
  }
  void update(){
    if (!frozen) y=y+dy;
  }
  void constrained(){
    if (y+D/2>height) freeze();
  }
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, D, D);
  }
}
