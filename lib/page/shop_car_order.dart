import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/cart_order_page_widget/price_detial_widget.dart';
import 'package:flutter_app_client/page/shop_car_bug_agin.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/customView/cart_page_widget/custom_nav_bar.dart';

var dropdown1Value = 'One';

class ShopCarOrderPage extends StatefulWidget {
  @override
  _ShopCarOrderPageState createState() => _ShopCarOrderPageState();
}

class _ShopCarOrderPageState extends State<ShopCarOrderPage> {
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
                    "order summary",
                    style: Theme.of(context).textTheme.headline,
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
                  child:
                  ListView(
                    children: <Widget>[

                      DefaultTextStyle
                        (style: Theme.of(context).textTheme.body1,
                        child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                    defaultColumnWidth: FixedColumnWidth(30.0),

                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(50.0),
                            1: FlexColumnWidth(100.0),
                            2: FixedColumnWidth(50.0),
                          },
                          border: TableBorder(horizontalInside: BorderSide(width: 0.5,color: Theme.of(context).dividerColor)),
                          children:  <TableRow>[
                            TableRow(
                              children: <Widget>[


                                Text('12X',style: Theme.of(context).textTheme.body1,),
                                Container(child: Text('items'),alignment: Alignment(-1, 0),height: 48,),
                                Text('C2'),
                              ],
                            ),
                            TableRow(

                              children: <Widget>[
                                Text('A2'),
                                Container(child: Text('items'),alignment: Alignment(-1, 0),height: 48,),
//                          Text('B2'),
                                Text('C2'),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Container(alignment: Alignment(-1, 0),height: 48,),
                                Text('TOTAL'),
                                Text('\$100'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: DP.DP_16,),
                      OrderSettingWidget(),
                      Divider(),
                      OrderSettingWidget(),
                      Divider(),

                      OrderSettingWidget(),


                    ],
                  ),

                )



              ),

//

              CustomNavBar(
                hiddenBackBTn: false,
                centerWidget: Positioned(child: Container(
                    width: 125,
                    height: 40,
                    decoration: BoxDecoration(
                        color: MainColor.deepVeryMainColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.black54)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: kCircularLineColor, width: 0.5)),
                    child: FlatButton(
                        child: Text("PAY",style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ShopCarBuyAginPage()));


                        })),),
              )
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

        height: DP.DP_96,
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

