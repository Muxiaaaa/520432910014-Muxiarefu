boolean draw=false;  //是否产生新粒子
int number=100;
ArrayList<Particle1> particles = new ArrayList<Particle1>();  //记录点击产生的粒子
ArrayList<Particle2> particles2 = new ArrayList<Particle2>();  //记录爆炸的粒子
 
void setup() {
  size(800, 400);
}
void draw() {
  fill(0, 50);
  rect(0, 0, 800, 400);
  provide();
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle1 p = particles.get(i);
    p.show();
  }
}
void mousePressed() {
  draw=true;
}
void provide() {
  if (draw==true) {
    particles.add(new Particle1(new PVector(mouseX, mouseY)));
    draw=false;
  }
}

/* 点击产生的粒子 */
class Particle1 {
  float r2=random(10, 12);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  PVector position;
  PVector sy;  //矢量速度
  PVector a;  //矢量加速度
  float lifespan = 255.0;  //不透明度
  Particle1(PVector l) {
    sy = new PVector(0, -6);  //上升初速度
    a = new PVector(0, 0.05);  //重力效果
    position = l.copy();
  }
  void show() {
    if (sy.y<0) {
      fill(r, g, b, lifespan);
      ellipse(position.x, position.y, r2, r2);  //粒子：小圆点
      lifespan=lifespan-1.5;
    }
    position.add(sy);
    sy.add(a);
    if (sy.y>0 && sy.y<0.05) {
      boom();
    }
    if (sy.y>0) {
      for (int j = particles2.size()-1; j >= 0; j--) {
        Particle2 p2 = particles2.get(j);
        p2.show();
        if (p2.dead==true) {
          particles2.remove(j);
        }
      }
    }
  }
  void boom() {
    for (int j=0; j<number; j++) {
      particles2.add(new Particle2(new PVector(position.x, position.y), r, g, b));
    }
  }
}

/* 爆炸产生的粒子 */
class Particle2 {
  float r1=random(4,5);
  PVector position;
  PVector velocity;  //矢量速度
  PVector acceleration;  //矢量加速度
  float lifespan;  //不透明度
  float r;
  float g;
  float b;
  boolean dead;
  float x, y;
  Particle2(PVector l, float r1, float g1, float b1) {
    acceleration = new PVector(0, 0.0008);  //掉落加速度
    while (true) {
      x=random(-0.5, 0.5);
      y=random(-0.5, 0.5);
      if (abs(x*x)+abs(y*y)<=0.25) {
        velocity = new PVector(x, y);
        break;
        //粒子溅射范围
      }
    }
    position = l.copy();
    lifespan = 255.0;  //不透明度
    r=r1;
    g=g1;
    b=b1;
    dead=false;
  }
  void show() {
    fill(r, g, b, lifespan);
    ellipse(position.x, position.y, r1, r1);
    position.add(velocity);
    if (velocity.y<1.7) {
      velocity.add(acceleration);
    }
    lifespan=lifespan-0.4;
    if (lifespan<0) {
      dead=true;}  }  }
