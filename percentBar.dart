import 'package:flutter/material.dart';

class PercentBar extends StatelessWidget {
  final Color backgroundColor, borderColor, progressColor;
  final double borderWidth, borderRadius, height;
  final double percentage;

  final EdgeInsetsGeometry padding;

  PercentBar({
    this.backgroundColor = Colors.transparent, this.borderColor = Colors.black, this.progressColor = Colors.blue,
    this.borderRadius = 25, this.borderWidth = 2, this.percentage = 0.3, this.height = 20,
    this.padding
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null ? padding : EdgeInsets.all(0),
      child: CustomPaint(
        painter: _PercentBarPainter(
          backgroundColor: this.backgroundColor,
          borderColor: this.borderColor,
          progressColor: this.progressColor,
          borderRadius: this.borderRadius,
          borderWidth: this.borderWidth,
          percentage: this.percentage
        ),
        size: Size.fromHeight(this.height),
      ),
    );
  }
}

class _PercentBarPainter extends CustomPainter{
  final Color backgroundColor, borderColor, progressColor;
  final double borderWidth, borderRadius;
  final double percentage;

  _PercentBarPainter({
    this.backgroundColor, this.borderColor, this.progressColor,
    this.borderRadius, this.borderWidth, this.percentage
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint mainPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height) , Radius.circular(borderRadius)), 
      borderPaint  
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height) , Radius.circular(borderRadius)), 
      mainPaint  
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, (size.width) * percentage, size.height) , Radius.circular(borderRadius)), 
      progressPaint  
    );


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}