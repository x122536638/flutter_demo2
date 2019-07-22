import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/customView.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool open = true;

  void changeOpenState() {
    setState(() {
      open = !open;
    });
  }

  void xx() {
    ListView();
  }

//  get v1 {
//    if (open) {
//      return SliverGrid(
//        delegate: SliverChildBuilderDelegate(
//          (BuildContext context, int index) {
//            return Text(index.toString());
//          },
//          childCount: 40,
//        ),
//        gridDelegate:
//            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//      );
//    } else {
//      return SliverList(
//        delegate: SliverChildBuilderDelegate(
//          (BuildContext context, int index) {
//            return Text(index.toString());
//          },
//          childCount: 40,
//        ),
//      );
//    }
//  }



get v1{


    if(open){
      return GridView.builder(

//        scrollDirection: Axis.horizontal,
          shrinkWrap: true,//
//         physics: NeverScrollableScrollPhysics(),
          physics: ClampingScrollPhysics(),//估计意思 contensize >size
          //而且能带动下面的视图滚动
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
            ),
            itemCount:20,
            itemBuilder: (context, index) {

              return ClassifyItemWidget();
            }
        );
    }else{
      return Container(
        height: 100,
        padding:EdgeInsets.all(8),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
//            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
            ),
            itemCount:20,
            itemBuilder: (context, index) {

              return ClassifyItemWidget();
            }
        ),
      );
    }

  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0 //显示区域宽高相等
      ),
      itemCount:40,
      itemBuilder: (context, index) {

        return Text(index.toString());
      }
  );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child:
//
//      v1,


      ListView(
//        shrinkWrap: true,
        children: <Widget>[
          v1,
          IconButton(icon: Icon(Icons.build), onPressed: (){
            changeOpenState();
          }),


        ],
      ),



    );
  }
}
