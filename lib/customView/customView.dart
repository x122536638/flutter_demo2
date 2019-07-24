import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//单个item
class ClassifyItemWidget extends StatefulWidget {

  ClassifyItemBean model;
  void Function(int) callback;


  ClassifyItemWidget(this.model,{this.callback});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ClassifyItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        widget.callback(widget.model.index);

      },
      child: Container(
//        color: widget.model.selected ?Colors.green:Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset('images/iconbg.png'),
          Text(widget.model.text,style: TextStyle(color: widget.model.selected?Colors.orange:Colors.black54),),
        ],),
      ),
    );
  }
}


class ClassifyItemBean{

  bool selected =false;
  int  index;
  String text ;
  String imageStr;

  ClassifyItemBean(this.selected,this.index, this.text, this.imageStr);


}







