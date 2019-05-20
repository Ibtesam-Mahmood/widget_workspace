import 'package:flutter/material.dart';

///A Button that can be pressed to toggle on and off
///The button is clipped either to the left or the right of the parent widget
class PollButton extends StatefulWidget {
  final Widget childOFF, childON;
  final Color colorON, colorOFF;
  final bool right;
  final double elevation;
  final Function onPressed;

  PollButton(
      {this.childOFF,
      this.childON,
      this.colorON = Colors.black,
      this.colorOFF = Colors.black,
      this.right = false,
      this.elevation = 2.0,
      this.onPressed});

  @override
  _PollButtonState createState() => _PollButtonState();
}

class _PollButtonState extends State<PollButton> {
  bool _btnTrigger = false;

  //the trigger value of the button that determines if it is on or off

  //toggles the button
  void toggle() {
    this.setState(() => {_btnTrigger = !_btnTrigger});
  }

  @override
  void initState() {
    super.initState();
    _btnTrigger = false;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //creates the shadow for elevation
      painter: _ClipShadowShadowPainter(
        clipper: _PollElevationClipper(this.widget.right),
        shadow: Shadow(blurRadius: this.widget.elevation),
      ),

      //button clipper
      child: ClipPath(
        clipBehavior: Clip.antiAlias,
        clipper: _PollClipper(this.widget.right),

        //actual button
        child: RawMaterialButton(
            fillColor: _btnTrigger ? this.widget.colorON : this.widget.colorOFF,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: _btnTrigger ? this.widget.childON : this.widget.childOFF,
            ),
            constraints: BoxConstraints(minWidth: 85, minHeight: 45),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: _btnTrigger ? this.widget.colorON : this.widget.colorOFF,
              ),
            ),
            onPressed: () => {
                  toggle(),
                  this.widget.onPressed != null
                      ? this.widget.onPressed()
                      : null,
                }),
      ),
    );
  }
}

//credits to coman3 github
///creates the shadow under the button for elevation
class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//The clipper that defines the elevation clip
//Sits slightly lowker than the usual clipper
class _PollElevationClipper extends CustomClipper<Path> {
  bool right;

  _PollElevationClipper([this.right = false]);

  @override
  Path getClip(Size size) {
    final double w = size.width, h = size.height;
    if (right == false)
      return Path()
        ..moveTo(w * 0.9, h * 0.5)
        ..quadraticBezierTo(w, h * 0.83, w * 0.8, h * 0.8)
        ..lineTo(w * 0.0, h * 0.8);
    else
      return Path()
        ..moveTo(w * 0.1, h * 0.5)
        ..quadraticBezierTo(0, h * 0.83, w * 0.2, h * 0.8)
        ..lineTo(w, h * 0.8);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

//Clipper that defines the shape of the button
class _PollClipper extends CustomClipper<Path> {
  //determines if the button is right or left orientation
  bool right;

  _PollClipper([this.right = false]);

  @override
  Path getClip(Size size) {
    final double w = size.width, h = size.height;
    if (right == false)
      return Path()
        ..quadraticBezierTo(0, h * 0.1, w * 0.08, h * 0.16)
        ..lineTo(w * 0.8, h * 0.16)
        ..quadraticBezierTo(w, h * 0.16, w, h * 0.5)
        ..quadraticBezierTo(w, h * 0.83, w * 0.8, h * 0.83)
        ..lineTo(w * 0.08, h * 0.83)
        ..quadraticBezierTo(0, h * 0.89, 0, h)
        ..close();
    else
      return Path()
        ..moveTo(w, 0)
        ..quadraticBezierTo(w, h * 0.1, w * 0.92, h * 0.16)
        ..lineTo(w * 0.2, h * 0.16)
        ..quadraticBezierTo(0, h * 0.16, 0, h * 0.5)
        ..quadraticBezierTo(0, h * 0.83, w * 0.2, h * 0.83)
        ..lineTo(w * 0.92, h * 0.83)
        ..quadraticBezierTo(w, h * 0.89, w, h)
        ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
