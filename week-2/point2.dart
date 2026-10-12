class Point {
  final int x;
  final int y;

  const Point({required this.x, required this.y});

  // make the translate that be able to translate the immutable
  

  @override
  String toString() {
    return "x: $x and y: $y";
  }
}

void main() {
  Point p = Point(x: 10, y: 15);
  print(p);
}
