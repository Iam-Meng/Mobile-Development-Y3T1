import 'point.dart';

class Rectangle {
  Point topLeft;
  Point bottomRight;

  Rectangle(this.topLeft, this.bottomRight);

  int getWidth() => bottomRight.x - topLeft.x;
  int getHeight() => topLeft.y - bottomRight.y;
  int getArea() => getWidth() * getHeight();
}

void main() {
  Point p1 = Point(x: 10, y: 60);
  Point p2 = Point(x: 40, y: 20);
  Rectangle r1 = Rectangle(p1, p2);
  print('');
  print('');
  print('');
}
