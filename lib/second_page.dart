

import 'package:flutter/cupertino.dart';

class Second_page extends StatelessWidget{

  final String title;

  Second_page({Key key, this.title}) : super(key : key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[Text(title)],
          ),
        )
      ],
    );
  }

}