

import 'package:flutter/material.dart';

class PriceDetialWidget extends StatefulWidget {
  @override
  _PriceDetialWidgetState createState() => _PriceDetialWidgetState();
}

class _PriceDetialWidgetState extends State<PriceDetialWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: <Widget>[
          
          Text("1    taxes   \$2.2   "),
          Divider(),
        ],
      ),
      
    );
  }
}
