
int cubeSize = 150;
int blockSize = 12;


void setup() {
  
  size(800,800, P3D);
  colorMode(HSB, 255);
}


void draw() {
  background(255);
  
  noStroke();
  
  translate(width / 2, height / 2, 200);
  rotateX(radians(map(mouseY, 0, height, 180, -180)));
  rotateY(radians(map(mouseX, 0, width, -180, 180)));
  
 
  float noiseMult = 0.01;
  float nx = noise(frameCount * noiseMult) * cubeSize;
  float ny = noise(1000 + frameCount * noiseMult) * cubeSize;
  float nz = noise(5000 + frameCount * noiseMult) * cubeSize;
  
  int maxCount = cubeSize - (cubeSize % blockSize);
  
  for (int x = 0; x <= cubeSize; x+=blockSize) {
    for (int y = 0; y <= cubeSize; y+=blockSize) {
      for (int z = 0; z <= cubeSize; z+=blockSize) {
    
        if (x != 0 && x != maxCount && y != 0 && y != maxCount && z != 0 && z != maxCount) {
          continue;
        }
        
     
        float mult = dist(x, y, z, nx, ny, nz);
        float offset = (frameCount + mult) * 0.1;
        float wave = sin(offset);
        
        pushMatrix();
        
    
        translate(x - cubeSize / 2, y - cubeSize / 2, z - cubeSize / 2);
        scale(wave);
        
      
        float colorHue = (frameCount + mult * 0.5) % 255;
        float colorBright = map(wave, -1, 1, 255, 0);
        fill(colorHue, 255, colorBright);
        
        sphere(blockSize * 0.9);
        
        popMatrix();
      }
    }
  }
}
