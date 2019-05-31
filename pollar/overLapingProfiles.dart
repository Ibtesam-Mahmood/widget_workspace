import 'package:flutter/material.dart';

class OverLapingProfiles extends StatelessWidget {
  bool img1;
  bool img2;
  OverLapingProfiles({this.img1 = false, this.img2 = false});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: this.img1
              ? Container(
                  height: 25,
                  width: 25,
                  child: Image.network(
                      "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-9/56184365_2581273798611913_5627952602957217792_n.jpg?_nc_cat=101&_nc_ht=scontent.fyyz1-1.fna&oh=f6b589cfa00da502a992008e195e848b&oe=5D539643"))
              : null,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: this.img1
              ? Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(25)),
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                        "https://scontent.fyyz1-1.fna.fbcdn.net/v/t1.0-9/56184365_2581273798611913_5627952602957217792_n.jpg?_nc_cat=101&_nc_ht=scontent.fyyz1-1.fna&oh=f6b589cfa00da502a992008e195e848b&oe=5D539643"),
                  ))
              : null,
        ),
      ],
    );
  }
}
