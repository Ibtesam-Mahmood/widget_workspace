import 'package:flutter/material.dart';

//Horizontlally scrolling list that animates a scroll to the button clicked
//TODO: NOT DONE AT ALL
class ISelctedList extends StatefulWidget {
  @override
  _ISelctedListState createState() => _ISelctedListState();
}

class _ISelctedListState extends State<ISelctedList> {
  List<ButtonStyling> catagories = List(5);
  List<String> names = List(5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catagories[0] = new ButtonStyling(onPressed: setClear, key: UniqueKey());
    catagories[1] = new ButtonStyling(onPressed: setClear, key: UniqueKey());
    catagories[2] = new ButtonStyling(onPressed: setClear, key: UniqueKey());
    catagories[3] = new ButtonStyling(onPressed: setClear, key: UniqueKey());
    catagories[4] = new ButtonStyling(onPressed: setClear, key: UniqueKey());
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        key: UniqueKey(),
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          this.catagories[0],
          this.catagories[1],
          this.catagories[2],
          this.catagories[3],
          this.catagories[4],
        ]));
  }

  void setClear(ButtonStyling btn) {
    setState(() {
      for (var i = 0; i < catagories.length; i++) {
        if(btn.key.toString() == catagories[i].key.toString()){
          catagories[i] = new ButtonStyling(onPressed: setClear, key: UniqueKey(), pressed: true,);
        }
        else if(catagories[i].pressed){
          catagories[i] = new ButtonStyling(onPressed: setClear, key: UniqueKey(), pressed: false,);
        }
      }
    });
  }
}

class ButtonStyling extends StatefulWidget {
  final String info;
  final bool pressed;

  final Key key;

  final Function onPressed;


  ButtonStyling({this.info = "Sports", this.pressed = false, this.onPressed, this.key}):
    super(key: key);
  
  @override
  _ButtonStylingState createState() => _ButtonStylingState();
}

class _ButtonStylingState extends State<ButtonStyling> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(this.widget.info,
            style: this.widget.pressed == true
                ? TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline)
                : TextStyle(fontSize: 21, color: Colors.black)),
        onPressed: () {
          setState((){
            if(this.widget.onPressed != null) this.widget.onPressed(this.widget);
          });
        });
  }
}
