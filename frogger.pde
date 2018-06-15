Frog frog;
Car[] cars;

float grid = 25;
int index = 0;
int totalCar = 40;
int gameState = 0; //0 Menu, 1 Game, 2 Finish

void resetGame() {
  frog = new Frog(width/2-grid/2, height-grid, 25);
}
void setup() {
  size(640, 275);
  resetGame();
  cars = new Car[totalCar];
  addCars(5, 1, 2);
  addCars(5, 2, -1.5);
  addCars(5, 3, 2.4);
  addCars(5, 4, -2.2);
  addCars(5, 5, 1.3);
  addCars(5, 6, -2);
  addCars(5, 7, 1.7);
  addCars(5, 8, -1.9);
}
void draw() {
  background(0);
  if(gameState == 0){
    textAlign(CENTER);
    textSize(32);
    text("Frogger", width/2, height/2 - 50);
    text("Click to start", width/2, height/2 + 50);
  }
  else if(gameState == 1){
    fill(125);
    rect(0, height-grid, width, grid);
    rect(0, height-grid*6, width, grid);
    rect(0, height-grid*11, width, grid);
    frog.show();
    for (Car car : cars) {
      car.show();
      car.update();
    }
    //collision
    color left = get(int(frog.x+1),int(frog.y+1));
    color right = get(int(frog.x+grid-1),int(frog.y+1));
    if(left != color(0,255,0) || right != color(0,255,0))
      resetGame();
    //win
    if(frog.y >= 0 && frog.y <= frog.h){
      gameState = 2;
    }
  }
  else if(gameState == 2){
    resetGame();
    textAlign(CENTER);
    fill(255, 255, 255);
    text("WON", width/2, height/2 - 50);
    text("Click to start", width/2, height/2 + 50);
  }
  
}
void keyPressed() {
  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN && frog.y < height-grid) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT && frog.x < width-grid) {
    frog.move(1, 0);
  } else if (keyCode == LEFT && frog.x > 0) {
    frog.move(-1, 0);
  }
}
public void mousePressed() {
  gameState = 1;
}
void addCars(int count, int row, float speed) {
  for (int i = 0; i < count; i++) {
    float x = i*150;
    if(row < 5)
      cars[index] = new Car(x, height-(grid*row+grid), grid*2, grid, speed, row);
     else
       cars[index] = new Car(x, height-(grid*(row+1)+grid), grid*2, grid, speed, row);
    index++;
  }
}
