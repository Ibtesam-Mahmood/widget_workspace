import 'package:flutter/material.dart';

import 'titledWidget.dart';

///The content that goes into a card
///Could be a text or an image/video
class CardContent extends StatelessWidget {

  final String content;
  final bool img;

  CardContent({this.content = "", this.img = false});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 15.0, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Text(
              this.content, 
              style: TextStyle(fontSize: 19),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: img? Image.network('https://pmcvariety.files.wordpress.com/2018/05/kanye-west-tmz-4.jpg?w=1000&h=563&crop=1', ) : null
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///The header that appears on the top of poth the poll card and post card
class CardHeader extends StatelessWidget {

  final String title; //the title for the header
  final Widget display; //the display within the round container
  final Widget prop; //the widget the appears under the title

  CardHeader({this.title = "", @required this.display, this.prop});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: this.display,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF353B48),
                    shape: BoxShape.circle
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TitledWidget(
                    this.title,
                    widget: this.prop,
                    headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF718093)),
                  onPressed: () => {},
                )
              ],
            ),
          ),
    );
  }
}