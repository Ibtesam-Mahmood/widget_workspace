import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'overLapingProfiles.dart';
import 'titledWidget.dart';
import 'pollButton.dart';
import 'eECard.dart';
import 'package:bloc/bloc.dart';

//POST CARD

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//POLL CARD

///A card that container a poll
class PollCard extends StatefulWidget {
  final String logo;
  final String title;
  final String headerText;
  final String main;
  final String name;
  const PollCard({
    this.logo = "H",
    this.title = "History",
    this.headerText = "18 trusts - 14m left",
    this.main =
        "Kanye had a point when he said Slavery for 400 years? That sounds like a choice.",
    this.name = "Ibtesam Mahmood",
    Key key,
  }) : super(key: key);

  @override
  _PollCardState createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {

  //defining the poll footer bloc
  _PollSelectedBloc _pollSelectedBloc = _PollSelectedBloc();

  @override
  void dispose() {
    _pollSelectedBloc.dispose(); //disposes the poll footer bloc on disopse
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _pollSelectedBloc,
      builder: (BuildContext context, _PollSelectedState state){
        return EECard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _CardHeader(
                display: Text(
                  this.widget.logo,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                title: this.widget.title,
                prop: Text(this.widget.headerText),
              ),
              _CardContent(
                content: this.widget.main,
                img: true,
              ),
              _PollCardSubmitted(
                name: this.widget.name,
                img: true,
              ),
              _PollCardFooter(
                pollEvent: state.pollEvent,
                onleftPressed: (){
                  setState(() {
                    _pollSelectedBloc.leftButtonClicked();
                  });
                },
                onRightPressed: (){
                  setState(() {
                    _pollSelectedBloc.rightButtonClicked();
                  });
                },
              )
            ],
          ),
        );
      },
    );
  }
}

//POLL CARD BLOC

enum _PollEvent{ right, left, none }

class _PollSelectedState{
  _PollEvent pollEvent;

  _PollSelectedState._();

  factory _PollSelectedState.initial() => _PollSelectedState._()..pollEvent = _PollEvent.none;
}

class _PollSelectedBloc extends Bloc<_PollEvent, _PollSelectedState>{
  
  void rightButtonClicked(){
    if(currentState.pollEvent == _PollEvent.right) dispatch(_PollEvent.none);
    else dispatch(_PollEvent.right);
  }

  void leftButtonClicked(){
    if(currentState.pollEvent == _PollEvent.left) dispatch(_PollEvent.none);
    else dispatch(_PollEvent.left);
  }

  @override
  _PollSelectedState get initialState => _PollSelectedState.initial();

  @override
  Stream<_PollSelectedState> mapEventToState(_PollEvent event) async* {
    switch(event){
      case _PollEvent.left: {
       yield currentState..pollEvent = _PollEvent.left;
       break;
      }
      case _PollEvent.right: {
        yield currentState..pollEvent = _PollEvent.right;
        break;
      }
      case _PollEvent.none: {
        yield currentState..pollEvent = _PollEvent.none;
        break;
      }

    }

  }
  
}

//POLL/POST CARD COMPONETS

///The footer that holds 2 poll buttons and manages the whole poll in the card
class _PollCardFooter extends StatelessWidget {

  final _PollEvent pollEvent;
  final Function onleftPressed, onRightPressed;

  _PollCardFooter({
    Key key,
    this.pollEvent = _PollEvent.none,
    @required this.onleftPressed,
    @required this.onRightPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          InActivePollButton(
            childOFF: Text("Agree"),
            colorOFF: Colors.yellow,
            childON: Text("17%"),
            colorON: Colors.green,
            elevation: 5,
            trigger: pollEvent == _PollEvent.left,
            onPressed: onleftPressed,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          OverLapingProfiles(img1: true, img2: true),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '10.2K',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                TextSpan(
                    text: ' replies',
                    style: TextStyle(color: Color(0xFF667180), fontSize: 15))
              ]),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
          InActivePollButton(
            childOFF: Text("Disagree"),
            colorOFF: Colors.yellow,
            childON: Text("17%"),
            colorON: Colors.green,
            elevation: 5,
            right: true,
            trigger: pollEvent == _PollEvent.right,
            onPressed: onRightPressed,
          ),
        ],
      ),
    );
  }
}

///The Footer that displays who the post is by
class _PollCardSubmitted extends StatelessWidget {
  final bool img;
  final String name;

  const _PollCardSubmitted({Key key, this.img = false, this.name = ""})
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
class _CardContent extends StatelessWidget {
  final String content;
  final bool img;

  _CardContent({this.content = "", this.img = false});

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
class _CardHeader extends StatelessWidget {
  final String title; //the title for the header
  final Widget display; //the display within the round container
  final Widget prop; //the widget the appears under the title

  _CardHeader({this.title = "", @required this.display, this.prop});

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