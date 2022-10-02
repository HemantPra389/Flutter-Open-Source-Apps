import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int choice = 3;
  double size = 100;
  Color selectedColor = Colors.indigo;
  Widget colouredCircle(Color color) {
    return Container(
      width: 24,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget shapeButton(int position) {
    Color currentColor = (choice == position)
        ? (selectedColor == Colors.white)
            ? Colors.black
            : Colors.white
        : Colors.grey;
    return InkWell(
      onTap: () {
        setState(() {
          choice = position;
        });
      },
      child: CustomPaint(
        size: const Size(24, 24),
        foregroundPainter: (position == 0)
            ? LineCustomPainter(currentColor)
            : (position == 1)
                ? TriangleCustomPainter(currentColor)
                : (position == 2)
                    ? RectangleCustomPainter(currentColor)
                    : (position == 3)
                        ? SquareCustomPainter(currentColor)
                        : (position == 4)
                            ? CircleCustomPainter(currentColor)
                            : (position == 5)
                                ? PentagonCustomPainter(currentColor)
                                : HexagonCustomPainter(currentColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor == Colors.white
          ? const Color(0xFF1F1F1F)
          : Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          double maxSliderValue = (constraints.maxWidth > constraints.maxHeight)
              ? constraints.maxHeight - 115
              : constraints.maxWidth;
          if (size >= maxSliderValue && maxSliderValue != 0) {
            size = maxSliderValue;
          }
          return Column(
            children: [
              Flexible(
                child: Center(
                  child: CustomPaint(
                    size: Size(size, size),
                    willChange: true,
                    foregroundPainter: (choice == 0)
                        ? LineCustomPainter(selectedColor)
                        : (choice == 1)
                            ? TriangleCustomPainter(selectedColor)
                            : (choice == 2)
                                ? RectangleCustomPainter(selectedColor)
                                : (choice == 3)
                                    ? SquareCustomPainter(selectedColor)
                                    : (choice == 4)
                                        ? CircleCustomPainter(selectedColor)
                                        : (choice == 5)
                                            ? PentagonCustomPainter(
                                                selectedColor)
                                            : HexagonCustomPainter(
                                                selectedColor),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: selectedColor,
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        shapeButton(0),
                        shapeButton(1),
                        shapeButton(2),
                        shapeButton(3),
                        shapeButton(4),
                        shapeButton(5),
                        shapeButton(6),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: (selectedColor == Colors.white)
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white.withOpacity(0.2),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Color>(
                              value: selectedColor,
                              iconEnabledColor: Colors.grey,
                              dropdownColor: Colors.white.withOpacity(0.5),
                              isDense: true,
                              borderRadius: BorderRadius.circular(10),
                              onChanged: (val) {
                                setState(() {
                                  selectedColor = val ?? Colors.indigo;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: Colors.white,
                                  child: colouredCircle(Colors.white),
                                ),
                                DropdownMenuItem(
                                  value: Colors.pink,
                                  child: colouredCircle(Colors.pink),
                                ),
                                DropdownMenuItem(
                                  value: Colors.red,
                                  child: colouredCircle(Colors.red),
                                ),
                                DropdownMenuItem(
                                  value: Colors.amber,
                                  child: colouredCircle(Colors.amber),
                                ),
                                DropdownMenuItem(
                                  value: Colors.orange,
                                  child: colouredCircle(Colors.orange),
                                ),
                                DropdownMenuItem(
                                  value: Colors.lime,
                                  child: colouredCircle(Colors.lime),
                                ),
                                DropdownMenuItem(
                                  value: Colors.green,
                                  child: colouredCircle(Colors.green),
                                ),
                                DropdownMenuItem(
                                  value: Colors.teal,
                                  child: colouredCircle(Colors.teal),
                                ),
                                DropdownMenuItem(
                                  value: Colors.lightBlueAccent,
                                  child: colouredCircle(Colors.lightBlueAccent),
                                ),
                                DropdownMenuItem(
                                  value: Colors.blueAccent,
                                  child: colouredCircle(Colors.blueAccent),
                                ),
                                DropdownMenuItem(
                                  value: Colors.indigo,
                                  child: colouredCircle(Colors.indigo),
                                ),
                                DropdownMenuItem(
                                  value: Colors.deepPurple,
                                  child: colouredCircle(Colors.deepPurple),
                                ),
                                DropdownMenuItem(
                                  value: Colors.brown,
                                  child: colouredCircle(Colors.brown),
                                ),
                                DropdownMenuItem(
                                  value: Colors.black,
                                  child: colouredCircle(Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider.adaptive(
                            min: 24,
                            max: maxSliderValue,
                            value: size,
                            activeColor: (selectedColor == Colors.white)
                                ? Colors.black
                                : Colors.white,
                            inactiveColor: Colors.grey,
                            thumbColor: (selectedColor == Colors.white)
                                ? Colors.black
                                : Colors.white,
                            onChanged: (val) {
                              setState(
                                () {
                                  size = val;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class LineCustomPainter extends CustomPainter {
  final Color color;

  LineCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleCustomPainter extends CustomPainter {
  final Color color;

  TriangleCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SquareCustomPainter extends CustomPainter {
  final Color color;

  SquareCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectangleCustomPainter extends CustomPainter {
  final Color color;

  RectangleCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height / 2),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircleCustomPainter extends CustomPainter {
  final Color color;
  final PaintingStyle style;
  CircleCustomPainter(this.color, {this.style = PaintingStyle.fill});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = style;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PentagonCustomPainter extends CustomPainter {
  final Color color;
  double _angleToRadian(double angle) {
    return angle * (pi / 180);
  }

  Offset _getOffset(double angle, double radius) {
    final rotationAwareAngle = angle - 90;
    final radian = _angleToRadian(rotationAwareAngle);
    final x = cos(radian) * radius + radius;
    final y = sin(radian) * radius + radius;
    return Offset(x, y);
  }

  PentagonCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    var paint = Paint()..color = color;
    var path = Path();
    Offset current = _getOffset(72, radius);
    path.moveTo(current.dx, current.dy);
    current = _getOffset(144, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(216, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(288, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(361, radius);
    path.lineTo(current.dx, current.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HexagonCustomPainter extends CustomPainter {
  final Color color;

  double _angleToRadian(double angle) {
    return angle * (pi / 180);
  }

  Offset _getOffset(double angle, double radius) {
    final rotationAwareAngle = angle - 90;
    final radian = _angleToRadian(rotationAwareAngle);
    final x = cos(radian) * radius + radius;
    final y = sin(radian) * radius + radius;
    return Offset(x, y);
  }

  HexagonCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    var paint = Paint()..color = color;
    var path = Path();
    Offset current = _getOffset(60, radius);
    path.moveTo(current.dx, current.dy);
    current = _getOffset(120, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(180, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(240, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(300, radius);
    path.lineTo(current.dx, current.dy);
    current = _getOffset(360, radius);
    path.lineTo(current.dx, current.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
