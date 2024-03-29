import 'package:flutter/material.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/page/shop_car_bug_agin.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';


import 'setting_address_detial.dart';

import 'package:flutter_app_client/res/constant.dart';


import 'package:flutter_app_client/res/font.dart';
abstract class OrderSettingWidget extends StatefulWidget {
//  UserAdressInfo user_adress_info;
  bool isOpen = false;
  String imageName;
  String lineOneString;
  String lineTwoString;

  //点击确定按钮的事件
  VoidCallback doneButtonClidck;

  OrderSettingWidget(
      {Key key,
      this.imageName,
      this.lineOneString,
      this.lineTwoString,
      this.doneButtonClidck})
      : super(key: key) {} //  OrderSettingWidget({})

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
              if (widget.isOpen) {
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
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: MainColor.deepVeryMainColor),
      child: Container(
//        color: kCheckoutAmber50,
//      height: DP.DP_96,
        child: Column(
          children: list,
        ),
      ),
    );
  }
}

//用户设置收获地址widget
class AddressSettingWidget extends OrderSettingWidget {
  UserAddressInfo addressModel;

  HomeScreen centerWidget;

//todo 修改父类的属性
  AddressSettingWidget({Key key, this.addressModel, @required doneButtonClidck})
      : super(key: key, doneButtonClidck: doneButtonClidck);

//  @override
//  AddressSettingWidgetDetial get centView {
//    return centerWidget = AddressSettingWidgetDetial(
//      addressModel: addressModel,
//    );
//  }
  @override
  HomeScreen get centView {

    return centerWidget = HomeScreen();
  }

  //拿到现在修改后的用户信息
  UserAddressInfo currentAddressInfo() {

   return centerWidget.getCurrentAddressInfo();
  }
}


//用户设置收获地址widget
class CulturalSettingWidget extends OrderSettingWidget {



  Widget centerWidget;

//todo 修改父类的属性
  CulturalSettingWidget({Key key, @required doneButtonClidck})
      : super(key: key, doneButtonClidck: doneButtonClidck);

//  @override
//  AddressSettingWidgetDetial get centView {
//    return centerWidget = AddressSettingWidgetDetial(
//      addressModel: addressModel,
//    );
//  }

  Widget buildItem(BuildContext context, int index) {
    return Container(
      height: DP.getDP(56),
      color: kcolorMainColor,
      padding:EdgeInsets.symmetric(horizontal:  DP.settingUserInfoDetialPadding),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text("地区  $index",style: MainFont.userSettingTextStyle,),
          ),
        ],
      ),
    );
  }
    @override

  Widget get centView {

    return centerWidget =  Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        //列表项构造器
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(title: Text("$index"));
//                },
        itemBuilder: buildItem,
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: DP.getDP(8.0),
//            color: Colors.white,
          );
        },
      ),
    );

  }


}



//用户设置收获地址widget
class LanguageSettingWidget extends OrderSettingWidget {


  Widget centerWidget;

//todo 修改父类的属性
  LanguageSettingWidget({Key key, @required doneButtonClidck})
      : super(key: key, doneButtonClidck: doneButtonClidck);

//  @override
//  AddressSettingWidgetDetial get centView {
//    return centerWidget = AddressSettingWidgetDetial(
//      addressModel: addressModel,
//    );
//  }

  Widget buildItem(BuildContext context, int index) {
    return Container(
      height: DP.getDP(56),
      color: kcolorMainColor,
      padding:EdgeInsets.symmetric(horizontal:  DP.settingUserInfoDetialPadding),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text("地区  $index",style: MainFont.userSettingTextStyle,),
          ),
        ],
      ),
    );
  }
  @override

  Widget get centView {

    return centerWidget = Container(
      alignment: Alignment(0, -1),
       height: 200,
      child: DropdownButtonHideUnderline(
        child: Container(
          padding: EdgeInsets.all(8),
          width: 144,
          height: 40,
          decoration: BoxDecoration(
              color: MainColor.backgroundTextField,
              borderRadius: BorderRadius.circular(5)),
//                    width: 200,
          child: DropdownButton<String>(
            isExpanded: true,
            value: '简体中文',
            onChanged: (String newValue) {
//              setState(() {
//                dropdown1Value = newValue;
//              });
            },
            items: <String>['简体中文', '繁体中文', 'ENGLISH', '日本语']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Text(
                      value,
                    ) //////DropdownButtonHideUnderline
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );

  }


}
