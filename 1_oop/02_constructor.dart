class Retangle {
  num width, height;

  Retangle(this.width, this.height);

  Retangle.square(num dimension) : this(dimension, dimension);

  num area() {
    return this.width * this.height;
  }
}

void main() {
  Retangle objectRetangle = new Retangle(3, 4);
  print(objectRetangle.area());

  Retangle objectSquare = new Retangle.square(3);
  print(objectSquare.area());
}