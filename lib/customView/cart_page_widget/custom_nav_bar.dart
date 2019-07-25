



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {


  final Widget centerWidget;

  const CustomNavBar({Key key,  this.centerWidget}) : super(key: key);


  @override
  _CustomNavBarState createState() => _CustomNavBarState();

}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {

            print('后退 点击了');

            Navigator.of(context).pop();
          }),


          FlatButton(onPressed: (){}, child: Text('checkout')),



          IconButton(icon: Icon(Icons.clear), onPressed: () {

            print('X 点击了');
;            Navigator.of(context).pop();
          }),
        ],
      ),
      bottom: 0,
      left: 0,
      right: 0,
      height: 56,


    );
  }
}
