import 'package:flutter/material.dart';

class DraggableScreen extends StatefulWidget {
  @override
  _DraggableScreenState createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {

  Offset delta;

  @override
  void initState() {
    super.initState();
    delta = Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails det){
        setState(() {
          delta = Offset(det.globalPosition.dx-50, det.globalPosition.dy-150);
        });
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: 100,
              height: 100,
              child: CustomPaint(
                painter: _DragPainter(Offset(0,0)),
              ),
            ),
            top: delta.dy,
            left: delta.dx,
          )
        ],
      )
    );
  }
}

class _DragPainter extends CustomPainter{

  final Offset delta;

  _DragPainter(this.delta);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(50 + delta.dx, 50 + delta.dy), 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}