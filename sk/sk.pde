 void setup() {
      size(700,700);
    }

    void draw() {
      background(255);
      translate(width/2, height/2);
      recursion(200, 0);
    }

    void recursion(float r, int num) {
      if (r > 10) {
        if (r > 30) {
          noFill();
          stroke(0);
        } else {
          fill(0);
        }
        float ratio = mouseX/(float)width;
        if (ratio > 0.6) {
          ratio = 0.6;
        }
        r = r * ratio;
        num ++;

        // 绘制中心矩形
        rectMode(CENTER);
        rect(0, 0, r * 2, r * 2);

        // 绘制四周矩形
        pushMatrix();
        rotate(millis()/1000.0 * num);
        translate(-r, -r);
        recursion(r, num);
        popMatrix();

        pushMatrix();
        rotate(millis()/1000.0 * num);
        translate(-r, r);
        recursion(r, num);
        popMatrix();

        pushMatrix();
        rotate(millis()/1000.0 * num);
        translate(r, -r);
        recursion(r, num);
        popMatrix();

        pushMatrix();
        rotate(millis()/1000.0 * num);
        translate(r, r);
        recursion(r, num);
        popMatrix();
      }
    }
