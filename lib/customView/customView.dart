import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassifyItemWidget extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ClassifyItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Image.asset('images/iconbg.png'),
        Text('sss'),
      ],),
    );
  }
}
