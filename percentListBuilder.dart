import 'package:flutter/material.dart';


class PercentListBuilder extends StatefulWidget {
  final List<Card> items;

  PercentListBuilder({
    this.items
  });

  @override
  _PercentListBuilderState createState() => _PercentListBuilderState();
}

class _PercentListBuilderState extends State<PercentListBuilder> {

  final List<double> heights = [];

  @override
  Widget build(BuildContext context) {
    heights.clear();
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int i) { 
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                print(constraints.constrainHeight());
                return this.widget.items[i];
              },
            );
          },
          itemCount: this.widget.items.length,
        ),
        ListView.builder(
          itemBuilder: (BuildContext context, int i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // Spacer(
                //   flex: height.toInt(),
                // ),
                Container(
                  alignment: Alignment.topRight,
                  color: Colors.blue,
                  width: 100,
                  height: 20,
                )
              ],
            );
          },
          itemCount: this.widget.items.length,
        ),
      ],
    );
  }
}