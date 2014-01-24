class Spin {
    float x, y, speed;
      float angle = 0.0;
        Spin(float xpos, float ypos, float s) {
              x = xpos;
                  y = ypos;
                      speed = s;
                        }
          void update() {
                angle += speed;
                  }
}
 
class SpinArm extends Spin {
    SpinArm(float x, float y, float s) {
          super(x, y, s);
            }
      void display() {
            strokeWeight(1);
                stroke(0);
                    pushMatrix();
                        translate(x, y);
                            angle += speed;
                                rotate(angle);
                                    line(0, 0, 66, 0);
                                        popMatrix();
                                          }
}
