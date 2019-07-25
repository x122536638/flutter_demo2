



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';

class CustomNavBar extends StatefulWidget {


  final Widget centerWidget;

  const CustomNavBar({Key key,  this.centerWidget}) : super(key: key);


  @override
  _CustomNavBarState createState() => _CustomNavBarState();

}

class _CustomNavBarState extends State<CustomNavBar> {

  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.centerWidget !=null){
      list = <Widget>[
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),border: Border.all(color: kCircularLineColor,width: 1)),
            child: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: () {
                  Navigator.of(context).pop();
                })),

//          IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {
//
//            print('后退 点击了');
//
//            Navigator.of(context).pop();
//          }),

        widget.centerWidget,


        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),border: Border.all(color: kCircularLineColor,width: 1)),
            child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.of(context).pop();
                })),

      ];
    }else{
      list = <Widget>[
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),border: Border.all(color: kCircularLineColor,width: 1)),
            child: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: () {
                  Navigator.of(context).pop();
                })),

//          IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {
//
//            print('后退 点击了');
//
//            Navigator.of(context).pop();
//          }),




        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),border: Border.all(color: kCircularLineColor,width: 1)),
            child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.of(context).pop();
                })),

      ];
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      child: Container(
//              color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:list
        ),
      ),
      bottom: 0,
      left: 0,
      right: 0,
      height: Dp.BottonNavHeigt,
    );
  }
}
