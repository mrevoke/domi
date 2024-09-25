import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';

class CustomMap extends StatelessWidget {
  final int rows = 5; // Number of rows
  final int columns = 5;

  const CustomMap({super.key}); // Number of columns

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => _handleTap(context, details),
      child: Stack(
        children: [
          Container(
            color: Colors.blue.shade900,
            child: CustomPaint(
              size: Size.infinite,
              painter: MapPainter(
                rows: rows,
                columns: columns,
                selectedHomeIndex: context.watch<MapProvider>().selectedHomeIndex,
              ),
            ),
          ),
          // Add the pin at the center home (center index)
          const Center(
            child: Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  void _handleTap(BuildContext context, TapUpDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);
    final cellWidth = renderBox.size.width / columns;
    final cellHeight = renderBox.size.height / rows;

    final tappedColumn = (localPosition.dx ~/ cellWidth).clamp(0, columns - 1);
    final tappedRow = (localPosition.dy ~/ cellHeight).clamp(0, rows - 1);

    final tappedIndex = tappedRow * columns + tappedColumn;

    context.read<MapProvider>().selectHome(tappedIndex);
  }
}

class MapPainter extends CustomPainter {
  final int rows;
  final int columns;
  final int? selectedHomeIndex;

  MapPainter({
    required this.rows,
    required this.columns,
    this.selectedHomeIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1;

    // Adjust cell sizes and randomness
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        final index = row * columns + column;

        // Define custom random size variations
        final widthVariation = (column % 2 == 0) ? 1.2 : 0.8;
        final heightVariation = (row % 2 == 0) ? 1.1 : 0.9;

        final cellWidth = (size.width / columns) * widthVariation;
        final cellHeight = (size.height / rows) * heightVariation;

        // Define starting position of the rectangle
        final dx = column * (size.width / columns);
        final dy = row * (size.height / rows);

        final rect = Rect.fromLTWH(dx, dy, cellWidth, cellHeight);

        // Randomize plot colors for more organic feel
        paint.color = index == selectedHomeIndex
            ? Colors.yellow
            : (index % 2 == 0 ? Colors.green.shade300 : Colors.green.shade400);

        canvas.drawRect(rect, paint);
        canvas.drawRect(rect, borderPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
