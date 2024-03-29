import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/customView.dart';
import 'package:flutter_app_client/customView/main_page_widget/item_card_widget.dart';
import 'package:flutter_app_client/customView/user_Info_page_widget/setting_userinfo_widget.dart'
    as setting;
import 'package:flutter_app_client/customView/user_Info_page_widget/setting_userinfo_widget.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/page/shop_car_page.dart';

import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/tool/scoped_model/global_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../res/colors.dart';
//page1

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  //ListTile
  get v1 {
    return Container(
      color: Colors.white, //因为总体颜色的黄色的 ,但是listtile的阴影需要白色作为底色
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
            boxShadow: [ //阴影
              BoxShadow(
                  color:Colors.black26,
                  offset: Offset(0.0,1.0),
                  blurRadius: 3.0
              )
            ]


        ),
        child: Column(
          children: <Widget>[
            Container(
              color: kCheckoutAmber50,
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: MainColor.lineSperaColor(context),
                    child: Image.asset(
                      'images/bg4.png',
                      fit: BoxFit.cover,
//                    width: 30,
                    ),
                  ),
                ),

//        leading: CircleAvatar(
//
//          backgroundImage: AssetImage('images/bg3.png'),
//        ),
                title: Text('Horse'),
                subtitle: Text('A strong animal'),
                trailing: FlatButton(
                  onPressed: () {},
                  child: Text('ACCOUNT'),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0x1F000000), width: 1),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get v2 {
    return Container(
        padding: EdgeInsets.all(DP.getDP(12.0)),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: kCheckoutAmber50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  width: 0.5, color: MainColor.borderColorLightDarkGary)),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 50,
                  child: Container(
                    height: DP.getDP(96.0),
                    padding: EdgeInsets.all(
                      DP.getDP(12.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Text('123131313'),
                          top: 0,
                          left: 0,
                          right: 0,
                        ),
                        Positioned(
                          child: Text(
                            '\$88.88',
                            style: TextStyle(
                                fontSize: DP.bigFontSize,
                                color: MainColor.textColorBlack),
                          ),
                          bottom: 0,
                          left: 0,
                          right: 0,
                        ),
                      ],
                    ),
                  )),
//          Divider(height: 100,color:kseparatedLineColor ,),
              Container(
                width: 0.5,
                height: DP.getDP(96.0),
                color: MainColor.borderColorLightDarkGary,
              ),
              Expanded(
                  flex: 50,
                  child: Container(
                    height: DP.getDP(96.0),
                    padding: EdgeInsets.all(
                      DP.getDP(12.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Text('1231322323131231313'),
                          top: 0,
                          left: 0,
                          right: 0,
                        ),
                        Positioned(
                          child: Text(
                            '\$88.88',
                            style: TextStyle(
                                fontSize: DP.bigFontSize,
                                color: MainColor.textColorBlack),
                          ),
                          bottom: 0,
                          left: 0,
                          right: 0,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  void func() {
    //全局模型更新
    print('回调了');
//      model.changeUserAddressInfo(UserAddressInfo(firstName: '陈'));
  }


  AddressSettingWidget _addressSettingWidget;
  AddressSettingWidget _addressSettingWidget2;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //拿到全局变量
    GlolbModel glolbModel = GlolbModel.of(context);
    print(glolbModel);
    print('!~~~~~~~~~~');

    return ScopedModelDescendant<GlolbModel>(builder: (
      BuildContext context,
      Widget child,
      GlolbModel model,
    ) {
      return Scaffold(
        body: Container(
          color: kCheckoutAmber50,
//          color: Colors.white,

          child:
//
//      v1,

              ListView(
//        shrinkWrap: true,
            children: <Widget>[
              v1,

//            SizedBox(height: 18,),
              Container(
                color: Colors.white,
                height: DP.getDP(8.0),
              ),
                  _addressSettingWidget = AddressSettingWidget(
                    key:UniqueKey(),
                  addressModel: model.userAddressInfo,
                  doneButtonClidck: () {
                    print('done 事件!!!');

                    //把   AddressSettingWidget 里的centerView里面的数据覆盖  model.userAddressInfo
                    //

                    model.changeUserAddressInfo(_addressSettingWidget.currentAddressInfo());//这儿出错了
                  }),
              Divider(),
                  _addressSettingWidget2 = AddressSettingWidget(
                  key:UniqueKey(),
                  addressModel: model.userAddressInfo,
                  doneButtonClidck: () {
                    print('done 事件!!!');

                    //把   AddressSettingWidget 里的centerView里面的数据覆盖  model.userAddressInfo
                    //

                    model.changeUserAddressInfo(_addressSettingWidget2.currentAddressInfo());//这儿出错了
                  }),
//            setting.OrderSettingWidget(),
              Divider(),
                  CulturalSettingWidget(doneButtonClidck: (){},),
//            setting.OrderSettingWidget(),
              Divider(),
                LanguageSettingWidget(doneButtonClidck: (){},),
              v2,
            ],
          ),
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
