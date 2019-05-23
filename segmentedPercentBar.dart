import 'package:flutter/material.dart';


///Creates a linear percentbar that has many customizable propeties
class SegmentedPercentBar extends StatelessWidget {
  final Color backgroundColor, borderColor;
  final double borderWidth, borderRadius, height;

  final List<Color> progressColors;
  final List<double> percentages;

  final EdgeInsetsGeometry padding;

  SegmentedPercentBar({
    this.backgroundColor = Colors.transparent, this.borderColor = Colors.black, @required this.progressColors,
    this.borderRadius = 25, this.borderWidth = 2, @required this.percentages, this.height = 20,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    if(percentages.length != progressColors.length) //throws an error if the percent values don't match
      throw("The lengths of the percentages list and progress colors list must be the same");

    return Padding(
      padding: padding != null ? padding : EdgeInsets.all(0),
      child: CustomPaint(
        painter: _SegmentedPercentBarPainter(
          backgroundColor: this.backgroundColor,
          borderColor: this.borderColor,
          progressColors: this.progressColors,
          borderRadius: this.borderRadius,
          borderWidth: this.borderWidth,
          percentages: this.percentages
        ),
        size: Size.fromHeight(this.height),
      ),
    );
  }
}

class _SegmentedPercentBarPainter extends CustomPainter{
  final Color backgroundColor, borderColor;
  final double borderWidth, borderRadius;

  final List<double> percentages;
  final List<Color> progressColors;

  _SegmentedPercentBarPainter({
    this.backgroundColor, this.borderColor, this.progressColors,
    this.borderRadius, this.borderWidth, this.percentages
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint mainPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
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

    //paints the progress bars layering them from end to start
    for (int i = progressColors.length - 1; i >= 0; i--) {
      progressPaint.color = progressColors[i];
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(i == 0 ? 0 : (size.width * (percentages[i-1])) - 20, 0, (size.width) * percentages[i], size.height), 
          Radius.circular(borderRadius)
        ), 
        progressPaint  
      );
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}