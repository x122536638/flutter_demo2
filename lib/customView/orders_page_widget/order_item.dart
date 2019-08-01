import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/res/font.dart';
import 'dart:ui';

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isOpen = false;

  void openClose() {
    isOpen = !isOpen;
    setState(() {});
  }

  Widget get openCloseBtn {
    Icon icon = isOpen
        ? Icon(Icons.keyboard_arrow_up)
        : Icon(Icons.keyboard_arrow_down);
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: MainColor.mainColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3, offset: Offset(0, 3), color: Colors.black54)
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kCircularLineColor, width: 0)),
        child: IconButton(
            icon: icon,
            onPressed: () {
              openClose();
            }));
  }

  @override
  Widget build(BuildContext context) {
    List data = List.generate(10, (int index) {
      return Container(
        height: 48,
        child: Row(
          children: <Widget>[

            Expanded(
              flex: 20,
              child: Text('1x'),
            ),
            Expanded(
              flex: 60,
              child: Text('body'),
            ),
            Expanded(
              flex: 20,
              child: Text('\$12'),
            ),
          ],
        ),
      );
    });

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(DP.samllPadding),
          decoration: BoxDecoration(color: kCheckoutAmber50),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
//                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DP.orders_item_image_radius)),
                    child: Image.asset(
                      'images/bg4.png',
                      fit: BoxFit.cover,
                      height: 190 *(DP.screenWidth - DP.samllPadding *2)/344,
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 80,
                          child: Text("SEE you soon",
                              style: MainFont.userSettingTextStyle),
                        ),
                        Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: kCircularLineColor, width: 0.5)),
                            child: FlatButton(
                                child: Text("help"), onPressed: () {}))
                      ],
                    ),
                    Text('JAN 2019 7 31 2:00pm'),
                    Text('order#q2371237129371'),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
//                                    color: kseparatedLineColor,
                                  );
                                },
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        data[index],
                                itemCount: isOpen ? data.length : 3,
                              )),
                            ],
                          ),
                          Container(child: Divider()),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 80,
                              ),
                              Text(
                                'TOLAL : \$100',
                                style: MainFont.orders_totalPriceStyle,
                              ),
                              Spacer(),
                              Container(
                                  width: 108,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: MainColor.deepVeryMainColor,
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                          color: kCircularLineColor,
                                          width: 0.5)),
                                  child: FlatButton(
                                      child: Text("reorder",style: TextStyle(color: Colors.white,fontSize: 16),), onPressed: () {})),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: openCloseBtn,
          bottom: 90,
        )
      ],
    );
  }
}

//List data = List.generate(10, (int index) {
//  return Row(
//    children: <Widget>[
//      Expanded(
//        flex: 20,
//        child: Text('1x'),
//      ),
//      Expanded(
//        flex: 60,
//        child: Text('body'),
//      ),
//      Expanded(
//        flex: 20,
//        child: Text('\$12'),
//      ),
//    ],
//  );
//});


