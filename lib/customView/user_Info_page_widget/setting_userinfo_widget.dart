import 'package:flutter/material.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/res/dp.dart';

abstract class OrderSettingWidget extends StatefulWidget {
//  UserAdressInfo user_adress_info;
  bool isOpen = false;
  String imageName;
  String lineOneString;
  String lineTwoString;

  //点击确定按钮的事件
  VoidCallback  doneButtonClidck;


  OrderSettingWidget(
      {Key key,
        this.imageName,
      this.lineOneString,
      this.lineTwoString,
      this.doneButtonClidck}):super(key : key){



  } //  OrderSettingWidget({})

  Widget get centView; //子类去实现


  @override
  _OrderSettingWidgetState createState() => _OrderSettingWidgetState();
}

class _OrderSettingWidgetState extends State<OrderSettingWidget> {

  String btnTitle() {
    return widget.isOpen ? 'DONE' : 'MOTIFY';
  }

  get v1 {
    return Row(
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
                Text(widget.lineOneString ?? "DEVIVERY WINDOW"),
                Text(widget.lineTwoString ?? "2:30-3:20PM"),
              ],
            ))
      ],
    );
  }

  get v2 {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
            onPressed: () {
              if(widget.isOpen){
                widget.doneButtonClidck();
              }
              widget.isOpen = !widget.isOpen;

              setState(() {});
            },
            child: Text(btnTitle())),
      ],
    );
  }

  get vCenter {
    return widget.centView ??
        Container(
          height: 200,
          color: Colors.red,
        );
  }

  get list {


//    return <Widget>[v1, vCenter, v2];

    if (widget.isOpen) {
      return <Widget>[v1, vCenter, v2];
    } else {
      return <Widget>[v1, v2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: DP.DP_96,
      child: Column(
        children: list,
      ),
    );
  }
}

//用户设置收获地址widget
class AddressSettingWidget extends OrderSettingWidget {
  UserAddressInfo addressModel;

  AddressSettingWidgetDetial centerWidget;



//todo 修改父类的属性
  AddressSettingWidget({Key key ,this.addressModel,@required doneButtonClidck}) : super(key:key,doneButtonClidck:doneButtonClidck);

  @override
  AddressSettingWidgetDetial get centView {
    return centerWidget =AddressSettingWidgetDetial(addressModel: addressModel,);
  }

  //拿到现在修改后的用户信息
  UserAddressInfo currentAddressInfo(){



    print(centerWidget.textEditingControllerFirstName.text);

    return UserAddressInfo(firstName:centerWidget.textEditingControllerFirstName.text );
  }


}

class AddressSettingWidgetDetial extends StatefulWidget {

  UserAddressInfo addressModel;

  AddressSettingWidgetDetial({this.addressModel}){

  }


  TextEditingController textEditingControllerFirstName =  TextEditingController();

  @override
  _AddressSettingWidgetDetialState createState() =>
      _AddressSettingWidgetDetialState();
}

class _AddressSettingWidgetDetialState
    extends State<AddressSettingWidgetDetial> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    widget.textEditingControllerFirstName.text = widget.addressModel.firstName;//问题是每次点击修改按钮都会走这个



  }

  //外界如何拿到地址信息?

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DP.getDP(25.0)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.textEditingControllerFirstName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      labelText: "firstname",
//                      hintText: "firstname",
                    ),

                ),
                flex: 1,
              ),
              SizedBox(width: DP.getDP(8.0),),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "lastname",
//                      hintText: "firstname",
                  ),
                ),
                flex: 1,
              )
            ],
          ),
          SizedBox(height: DP.getDP(45),),
          Row(
            children: <Widget>[

              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "street1",
//                      hintText: "firstname",
                  ),
                ),
                flex: 1,
              )

            ],
          ),
          SizedBox(height: DP.getDP(45),),



        ],
      ),
    );
  }
}
