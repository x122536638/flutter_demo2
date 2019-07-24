import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0 //显示区域宽高相等
                  ),
                  itemCount:40,
                  itemBuilder: (context, index) {

                    return Text(index.toString());
                  }
              ),
            ),

            Positioned(
                  child: IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {
                    Navigator.of(context).pop();
                  }),
                bottom: 0,

              ),

            ],
          ),
        ),
      ),
    );
  }
}
