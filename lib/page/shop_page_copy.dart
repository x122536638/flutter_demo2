import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {



  bool open =false;


  void changeOpenState(){
    setState(() {
      open = !open;
    });

  }




 void xx(){


   ListView();
 }


  get v1{

    if(open){
      return SliverGrid(

        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Text(index.toString());
          },
          childCount: 40,

        ),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      );
    }else{
      return SliverList(
        delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
          return Text(index.toString());
        },
          childCount: 40,),
      );


    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: CustomScrollView(
        slivers: <Widget>[
//          GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 1,
//              ),
//              itemBuilder: (BuildContext context, int index){
//                return Text('SS');
//              }
//              ),

        v1,
          SliverList(delegate:SliverChildListDelegate([IconButton(icon: Icon(Icons.build), onPressed: changeOpenState)]) ,),
        ],
      ),
    );
  }
}
