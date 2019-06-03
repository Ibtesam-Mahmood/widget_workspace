import 'package:flutter/material.dart';

///A modal bottom sheet that opens when a message is being sent
///displays the possible contacts you can send the message to
///Also has an area for an input for the message
class MessageSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0737373),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search), //TODO: Search icon change
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search contacts..."
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int i){
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 20),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey
                        ),
                        child: Center(child: Text("temp")),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a message..."
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}