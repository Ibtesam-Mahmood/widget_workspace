import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  final Color color;
  final double elevation;
  final Widget child;
  final bool right;

  Walkthrough(
      {this.color = Colors.blueAccent,
      this.elevation = 8,
      this.child,
      this.right = false});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      clipper: _WalkthroughClipper(right),
      child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: this.color,
          elevation: this.elevation,
          constraints: BoxConstraints(minHeight: 200, minWidth: 200),
          onPressed: () => {},
          child: Padding(
            padding: this.right == false
                ? const EdgeInsets.only(right: 90, bottom: 90)
                : const EdgeInsets.only(bottom: 90, left: 90),
            child: this.child,
          )),
    );
  }

  bool getRight() {
    return this.right;
  }
}

class _WalkthroughClipper extends CustomClipper<Rect> {
  final bool right;
  _WalkthroughClipper([this.right = false]);
  @override
  Rect getClip(Size size) {
    if (right == false) {
      Rect rectangle = Rect.fromLTWH(0, 0, size.width / 2, size.height / 2);
      return rectangle;
    } else {
      Rect rectangle =
          Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height / 2);
      return rectangle;
    }
  }

  bool getright() {
    return this.right;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
