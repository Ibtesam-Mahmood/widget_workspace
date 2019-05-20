import 'package:flutter/material.dart';
import 'overLapingProfiles.dart';
import 'titledWidget.dart';
import 'pollButton.dart';

///A card that container a poll
class PollCard extends StatefulWidget {
  const PollCard({
    Key key,
  }) : super(key: key);

  @override
  _PollCardState createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CardHeader(
            display: Text(
              "H",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            title: "History",
            prop: Text("18 trusts - 14m left"),
          ),
          CardContent(
            content:
                "Kanye had a point when he said Slavery for 400 years? That sounds like a choice.",
            img: true,
          ),
          PollCardSubmitted(
            name: "Ibtesam Mahmood",
            img: true,
          ),
          PollCardFooter()
        ],
      ),
    );
  }
}

///The footer that holds 2 poll buttons and manages the whole poll in the card
class PollCardFooter extends StatelessWidget {
  const PollCardFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          PollButton(
            childOFF: Text("Agree"),
            colorOFF: Colors.yellow,
            childON: Text("17%"),
            colorON: Colors.green,
            elevation: 5,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          OverLapingProfiles(img1: true, img2: true),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          PollButton(
            childOFF: Text("Disagree"),
            colorOFF: Colors.yellow,
            childON: Text("17%"),
            colorON: Colors.green,
            elevation: 5,
            right: true,
          ),
        ],
      ),
    );
  }
}

///The Footer that displays who the post is by
class PollCardSubmitted extends StatelessWidget {
  final bool img;
  final String name;

  const PollCardSubmitted({Key key, this.img = false, this.name = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: this.img
                ? Container(
                    height: 25,
                    width: 25,
                    child: Image.network(
                        "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-9/56184365_2581273798611913_5627952602957217792_n.jpg?_nc_cat=101&_nc_ht=scontent.fyyz1-1.fna&oh=f6b589cfa00da502a992008e195e848b&oe=5D539643"))
                : null,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 3),
            child: Text("Submitted by"),
          ),
          Text(
            this.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

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
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 10.0, left: 20, right: 20),
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
                  child: img
                      ? Image.network(
                          'https://pmcvariety.files.wordpress.com/2018/05/kanye-west-tmz-4.jpg?w=1000&h=563&crop=1',
                        )
                      : null),
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
                  color: Color(0xFF353B48), shape: BoxShape.circle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TitledWidget(
                this.title,
                widget: this.prop,
                headerStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
