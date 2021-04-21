class Square {
  int x;
  int y;
  String state;

  Square(this.x, this.y, this.state);

  set setSquareState(state) {
    this.state = state;
  }

  int get getPositionX => this.x;
  int get getPositionY => this.y;
}
