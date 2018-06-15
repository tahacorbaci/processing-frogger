class Car extends Rectangle {
  float speed;

  Car(float x, float y, float w, float h, float s, int c) {
    super(x, y, w, h, c);
    speed = s;
  }
  void update() {
    x += speed;

    if (speed > 0 && x > width + grid) {
      x = -grid-w;
    } else if (speed < 0 && x < -grid) {
      x = width+grid;
    }
  }
  void show() {
    if (c == 1)
      fill(255, 0, 0);
    else if (c == 2)
      fill(0, 254, 0);
    else if (c == 3)
      fill(0, 0, 255);
    else if (c == 4)
      fill(255, 255, 0);
    else if (c == 5)
      fill(255, 0, 255);
    else if (c == 6)
      fill(0, 255, 255);
    else if (c == 7)
      fill(0, 125, 125);
    else if (c == 8)
      fill(125, 125, 0);
    rect(x, y, w, h);
  }
}
