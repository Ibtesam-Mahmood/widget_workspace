import 'package:flutter/material.dart';

class TitledWidget extends StatelessWidget {
  final String text;
  final Widget widget;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  
  TitledWidget(this.text, {this.widget, this.mainAxisAlignment = MainAxisAlignment.center, this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: this.mainAxisAlignment,
      crossAxisAlignment: this.crossAxisAlignment,
      children: <Widget>[
        Text(text),
        widget
      ],
    );
  }
}