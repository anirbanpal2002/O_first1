import 'package:flutter/material.dart';

class Snake extends StatelessWidget {
  final int rows;
  final int columns;
  final double cellSize;

  const Snake({
    Key? key,
    required this.rows,
    required this.columns,
    required this.cellSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: SnakePainter(rows, columns, cellSize));
  }
}

class SnakePainter extends CustomPainter {
  final int rows;
  final int columns;
  final double cellSize;

  SnakePainter(this.rows, this.columns, this.cellSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill;

    // Example: draw a diagonal line of "snake" blocks
    for (int i = 0; i < rows && i < columns; i++) {
      final left = i * cellSize;
      final top = i * cellSize;
      canvas.drawRect(Rect.fromLTWH(left, top, cellSize, cellSize), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
