import 'package:flutter/material.dart';

class Catagories extends StatefulWidget {
  @override
  _CatagoriesState createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  List<ButtonStyling> catagories = List(5);
  List<String> names = List(5);
  @override
  Widget build(BuildContext context) {
    catagories[0] = new ButtonStyling();
    catagories[1] = new ButtonStyling();
    catagories[2] = new ButtonStyling();
    catagories[3] = new ButtonStyling();
    catagories[4] = new ButtonStyling();
    return Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          this.catagories[0],
          this.catagories[1],
          this.catagories[2],
          this.catagories[3],
          this.catagories[4],
        ]));
  }

  void setClear() {
    setState(() {});
  }
}

class ButtonStyling extends StatefulWidget {
  final String info;
  final bool initialToggle;

  ButtonStyling([this.info = "Sports", this.initialToggle = false]);
  @override
  _ButtonStylingState createState() => _ButtonStylingState();
}

class _ButtonStylingState extends State<ButtonStyling> {
  bool pressed;

  void setPressed(bool value) {
    pressed = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pressed = this.widget.initialToggle;
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    pressed = this.widget.initialToggle;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(this.widget.info,
            style: pressed == true
                ? TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline)
                : TextStyle(fontSize: 21, color: Colors.black)),
        onPressed: () {
          setState(() {
            pressed = true;
          });
        });
  }
}
