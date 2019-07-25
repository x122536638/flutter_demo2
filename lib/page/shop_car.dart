import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/customView/cart_page_widget/custom_nav_bar.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {



  Widget buildItem(BuildContext context, int index) {
    //设置字体样式
    TextStyle textStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    //设置Padding
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.asset('images/bg3.png',width: 60,fit: BoxFit.cover)),
            Expanded(
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
            Image.asset('images/iconbg.png'),
          ],
        ),
    );



  }





  @override
  Widget build(BuildContext context) {

    Widget divider1=Divider(color: Colors.blue,);



    return Scaffold(
//      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
//        Colors.amber,
        child: Container(
          decoration: BoxDecoration(color:kCheckoutAmber50, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dp.CarRadius)),),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: <Widget>[
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("my cart",style: TextStyle(color: Colors.orange,fontSize:24 ),),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child:ListView.separated(
                itemCount: 100,
                //列表项构造器
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(title: Text("$index"));
//                },


              itemBuilder: buildItem,
                //分割器构造器
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: kseparatedLineColor,);
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

              CustomNavBar(centerWidget: IconButton(icon: Icon(Icons.ac_unit), onPressed: (){print('QQQQQQQQQQ外部调用');}),)


            ],
          ),
        ),
      ),
    );
  }
}
