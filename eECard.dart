import 'package:flutter/material.dart';

class EECard extends StatelessWidget {
  final Widget child;
  const EECard({
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 3, offset: Offset(0, 2))
              ]),
          child: this.child),
    );
  }
}
