class Frog extends Rectangle {

  Frog(float x, float y, float w) {
    super(x, y, w, w, 0);
  }
  void show() {
    fill(0, 255, 0);
    rect(x, y, w, w);
  }
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
  }
}
