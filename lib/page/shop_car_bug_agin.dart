import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/cart_order_page_widget/price_detial_widget.dart';
import 'package:flutter_app_client/customView/main_page_widget/item_card_widget.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/customView/cart_page_widget/custom_nav_bar.dart';

var dropdown1Value = 'One';

class ShopCarBuyAginPage extends StatefulWidget {
  @override
  _ShopCarBuyAginPageState createState() => _ShopCarBuyAginPageState();
}

class _ShopCarBuyAginPageState extends State<ShopCarBuyAginPage> {
  List list = new List<String>.generate(3, (i) => i.toString());




  Widget item(BuildContext context, int index){

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
                BorderRadius.only(topLeft: Radius.circular(Dp.CarRadius)),
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
                    "buy agin",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                bottom: 80,
                left: 24,
                right: 24,
                child:



                Padding(
                  padding: const EdgeInsets.only(left:12 ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //每行三列
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/1.3, //显示区域宽高相等
                        ),
                        itemCount:40,
                        itemBuilder: (context, index) {
                          return ItemCardWidget();
                        }
                    ),
                  ),

                )



              ),

//

              CustomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}


class OrderSettingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Container(

        height: Dp.DP_96,
        child: Row(
          children: <Widget>[


            Expanded(
              flex: 20,
              child: Icon(Icons.credit_card),
            ),
            Expanded(
              flex: 80,
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[

                    Text("DEVIVERY WINDOW"),
                    Text("2:30-3:20PM"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(onPressed: (){}, child: Text('MOTIFY')),
                      ],
                    ),

                  ],
                ))
          ],
        ),


      ),
    );
  }
}

