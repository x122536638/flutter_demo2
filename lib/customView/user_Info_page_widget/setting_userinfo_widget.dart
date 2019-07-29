import 'package:flutter/material.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/res/dp.dart';

abstract class OrderSettingWidget extends StatefulWidget {
//  UserAdressInfo user_adress_info;
  bool isOpen = true;
  String imageName;
  String lineOneString;
  String lineTwoString;

  OrderSettingWidget(
      {this.imageName,
      this.lineOneString,
      this.lineTwoString}); //  OrderSettingWidget({})

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

class AddressSettingWidget extends OrderSettingWidget {
  UserAddressInfo addressModel;

  AddressSettingWidget({this.addressModel}) : super();

  @override
  // TODO: implement centView
  Widget get centView {
    return AddressSettingWidgetDetial();
  }
}

class AddressSettingWidgetDetial extends StatefulWidget {
  @override
  _AddressSettingWidgetDetialState createState() =>
      _AddressSettingWidgetDetialState();
}

class _AddressSettingWidgetDetialState
    extends State<AddressSettingWidgetDetial> {



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
