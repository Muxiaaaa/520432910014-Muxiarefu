void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(100,75,150);
  noFill();
  stroke(0);
  for (int i = 0; i < 20; i=i+1) {
    float degree = radians((millis()+50*i)/6.18);
    float pingPong = sin(degree);
    float sw = map(pingPong, -1, 1, 50, 10);
    strokeWeight(sw);
    float r = i*map(pingPong, -1, 1, 160, 60);
    ellipse(width/2, height/2, r, r);
  }
}
