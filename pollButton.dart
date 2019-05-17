import 'package:flutter/material.dart';
import 'dart:math';

///A Button that can be pressed to toggle on and off
///The button is clipped either to the left or the right of the parent widget
class PollButton extends StatefulWidget {
  final Widget childOFF, childON;
  final Color colorON, colorOFF;

  PollButton({this.childOFF, this.childON, this.colorON, this.colorOFF});

  @override
  _PollButtonState createState() => _PollButtonState();
}

class _PollButtonState extends State<PollButton> {
  
  //the trigger value of the button that determines if it is on or off
  bool _btnTrigger = false;

  //toggles the button
  void toggle(){
    _btnTrigger = !_btnTrigger;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _btnTrigger = false;
  }


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: _PollPaint(
        colorOFF: this.widget.colorOFF,
      ),
      onPressed: () => print("hi"),
    );
  }
}

/*
CustomPaint(
        child: this.widget.childOFF,
        painter: _PollPaint(
          colorOFF: this.widget.colorOFF,
        ),
      ),
*/

class _PollPaint extends ShapeBorder{

  Color colorOFF = Colors.red, colorON = Colors.green;

  Path _path;

  _PollPaint({this.colorOFF, this.colorON}){
    _path = Path();
    _path.moveTo(0, 10);
    _path.quadraticBezierTo(5, 25, 25, 25);
    _path.lineTo(50, 25);
    _path.quadraticBezierTo(80, 25, 80, 45);
    _path.quadraticBezierTo(80, 65, 50, 65);
    _path.lineTo(50, 65);
    _path.lineTo(25, 65);
    _path.quadraticBezierTo(5, 65, 0, 80);
    _path.lineTo(0, 0);
  }

  @override
  // TODO: Bruh what do these even mean
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: Bruh what do these even mean
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: Bruh what do these even mean
    return null;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
        Paint paint = Paint()
      ..color = colorOFF
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    
    canvas.drawPath(_path, paint);

  }

  @override
  ShapeBorder scale(double t) {
    // TODO: Bruh what do these even mean
    return null;
  }

  
}
