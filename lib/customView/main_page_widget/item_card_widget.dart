import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';

class ItemCardWidget extends StatefulWidget {
  //需要1个模型 和2个事件
  @override
  _ItemCardWidgetState createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),color: Colors.red),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//        Image.asset('images/iconbg2.png'),
          Row(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                  child: Image.asset(
                    'images/iconbg3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dp.DP_4),
//              color: Theme.of(context).primaryColor,
                color: kCheckoutAmber50,
                child: Row(
                  children: <Widget>[
                    Text(
                      '\$2.2',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: kColorFontBlack1),
                    ),
                    Text('/Bag'),
                    Spacer(),

                    GestureDetector(onTap: (){print('UP');},child: Icon(Icons.shopping_cart))


//                    MaterialButton(child: Icon(Icons.cached),minWidth: 27,)
//                  Container(width: 27,child: FlatButton(child: Icon(Icons.shopping_cart),onPressed: (){},))


//                    Container(
//                        padding: EdgeInsets.all(0),
//                        width: 27,child: IconButton(icon: Icon(Icons.build), onPressed: (){}))

//                    IconButton(
//                        icon: Icon(Icons.shopping_cart), onPressed: () {})
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
