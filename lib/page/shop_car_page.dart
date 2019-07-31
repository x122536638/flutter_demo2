import 'package:flutter/material.dart';
import 'package:flutter_app_client/page/shop_car_order.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/customView/cart_page_widget/custom_nav_bar.dart';

var dropdown1Value = 'One';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  List list = new List<String>.generate(3, (i) => i.toString());

  Widget buildItem(BuildContext context, int index) {
    //设置字体样式
    TextStyle textStyle =
        new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    //设置Padding
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:
                  Image.asset('images/bg3.png', width: 60, fit: BoxFit.cover)),
          Expanded(
            flex: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('ITEM1'),
                  Text('ITEM224242424242423423423423423423423'),
                ],
              ),
            ),
          ),

//            Expanded(flex: 50,child: DropdownButtonCustom()),
          DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: kCarSelectNubColor,
                  borderRadius: BorderRadius.circular(5)),
              width: 200,
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdown1Value,
                onChanged: (String newValue) {
                  setState(() {
                    if (newValue == 'Zero') {
                      list.removeAt(index);
                      setState(() {});

                      return;
                    }
                    dropdown1Value = newValue;
                  });
                },
                items: <String>['Zero', 'One', 'Two', 'Three', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          value,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '11112222233334444',
                          maxLines: 1,
                        ) //////DropdownButtonHideUnderline
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );

    return Scaffold(
//      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
//        Colors.amber,
        child: Container(
          decoration: BoxDecoration(
            color: kCheckoutAmber50,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(DP.CarRadius)),
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: <Widget>[
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "my cart",
                    style: TextStyle(color: Colors.orange, fontSize: 24),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                bottom: 80,
                left: 0,
                right: 0,
                child: ListView.separated(
                  itemCount: list.length,
                  //列表项构造器
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(title: Text("$index"));
//                },

                  itemBuilder: buildItem,
                  //分割器构造器
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: kseparatedLineColor,
                    );
                  },
                ),
              ),

//            Positioned(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {
//                        Navigator.of(context).pop();
//                      }),
//                      FlatButton(onPressed: (){}, child: Text('checkout')),
//                      IconButton(icon: Icon(Icons.clear), onPressed: () {
//                        Navigator.of(context).pop();
//                      }),
//                    ],
//                  ),
//                bottom: 0,
//              left: 0,
//              right: 0,
//
//
//              ),

              CustomNavBar(
                  centerWidget: Container(
                    height: 34,
                    child: RaisedButton(

                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShopCarOrderPage()));

//                  ShopCarOrderPage
//                    Navigator.push(context, MaterialPageRoute<void>(
//                      builder: (BuildContext context) {
//                        return Scaffold(
//                          body: Center(
//                            child: FlatButton(
//                              child: Text('POP'),
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                            ),
//                          ),
//                        );
//                      },
//                    ));
                },
                color: kcolorDeepMainColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
//                shape: drawShape('radius'),
                child: Text('check out', style: TextStyle(color: Colors.white)),
              ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
