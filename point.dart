import 'dart:math' as math;

class Point {
  final num x, y;  // "final" = cannot be changed after assignment

  Point(this.x, this.y);

  Point.origin()
      : x = 0,
        y = 0;

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return math.sqrt(dx * dx + dy * dy);
  }

  Point operator +(Point other) => new Point(x + other.x, y + other.y);
}

void main() {
  var p1 = new Point(10, 10);
  var p2 = new Point.origin();
  var distance = p1.distanceTo(p2);
  print(distance);
}
