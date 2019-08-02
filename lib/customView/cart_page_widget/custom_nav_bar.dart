import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';

class CustomNavBar extends StatefulWidget {
  final bool hiddenBackBTn;
  final Widget centerWidget;


  const CustomNavBar({Key key, this.centerWidget, this.hiddenBackBTn = true})
      : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  Widget _backBTN;
  Widget _closeBTN;
  List<Widget> list; //需求分析从外面传来一个widget   NAV通过透明度控制影藏  postion进行定位

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backBTN = backBTN();
    _closeBTN = closeBTN();

    list = [backBTN(), closeBTN()];

    if (widget.centerWidget != null) {
      list.add(widget.centerWidget);
    }
  }

  void _close() {
    NavigatorState nav = Navigator.of(context); //state里可以拿到context
    nav.popUntil(ModalRoute.withName("${nav.widget.initialRoute}"));
  }

  void _back() {
    Navigator.of(context).pop();
  }

  Widget closeBTN() {
    return Positioned(
        right: 20,
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: kCircularLineColor, width: 1)),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: _close,
            )));
  }

  Widget backBTN() {
    return Positioned(
        left: 20,
        child: Opacity(
          opacity: widget.hiddenBackBTn? 0.0:1.0,
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: kCircularLineColor, width: 1)),
              child: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: _back,
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
//    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
//    print(parentRoute.canPop);

    return Positioned(
      child: Container(
//              color: Colors.red,
        child: Stack(alignment: AlignmentDirectional.center, children: list),
      ),
      bottom: 0,
      left: 0,
      right: 0,
      height: DP.BottonNavHeigt,
    );
  }
}
