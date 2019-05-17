import 'package:flutter/material.dart';


//A simple slated container that is slanted to the right or left by a defined # of pixels
class SlantedContainer extends StatelessWidget {
  final double height, width;
  final double left, right;
  final Widget child;
  final Color color;

  SlantedContainer({this.height = 0, this.width = 0, this.child, this.left = 0, this.right = 0, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: CustomPaint(
        painter: _SlantedPainter(
          height: this.height,
          width: this.width,
          left: this.left,
          right: this.right,
          color: this.color
        ),
        child: this.child,
      )
    );
  }
}

class _SlantedPainter extends CustomPainter{
  final height, width;
  double left = 0, right = 0;
  Color color = Colors.transparent;

  _SlantedPainter({@required this.height, @required this.width, this.left, this.right, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;

    Path path = Path();
    path.lineTo(0, height + left);
    path.lineTo(width, height + right);
    path.lineTo(width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}