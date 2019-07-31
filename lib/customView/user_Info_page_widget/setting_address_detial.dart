import 'package:flutter/material.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/page/shop_car_bug_agin.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';
import 'package:flutter_app_client/tool/scoped_model/global_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app_client/res/colors.dart';




class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  UserAddressInfo getCurrentAddressInfo(){
    
    
    _state.tabController.index;
    print('sssssss');
    print(_state.tabController.index);
    AddressSettingWidgetDetial settingWidgetDetial =   _state.settingList[_state.tabController.index];

    return UserAddressInfo(firstName:settingWidgetDetial.textEditingControllerFirstName.text);
    
  }

  HomeWidgetState   _state;
  
  
  

  @override
  State<StatefulWidget> createState() {
    return  _state = HomeWidgetState();
  }
}
class HomeWidgetState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  List<AddressSettingWidgetDetial> settingList;
  
  
  final List<Tab> tabs = <Tab>[
    new Tab(child: Container(alignment: Alignment(0, 0),child: Text("1"),height: 100,width: 63,decoration: BoxDecoration(border: Border.all(color: MainColor.borderColorLightDarkGary),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),),),
    new Tab(child: Container(alignment: Alignment(0, 0),child: Text("2"),height: 100,width: 63,decoration: BoxDecoration(border: Border.all(color: MainColor.borderColorLightDarkGary),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),),),

    new Tab(child: Container(alignment: Alignment(0, 0),child: Text("3"),height: 100,width: 63,decoration: BoxDecoration(border: Border.all(color: MainColor.borderColorLightDarkGary),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),),),

  ];
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: tabs.length);
    tabController.addListener((){

      switch (tabController.index) {
        case 0:
          print(1);
          break;
        case 1:
          print(2);
          break;
        case 2:
          print(3);
          break;
      }

    });




  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {





    return ScopedModelDescendant<GlolbModel>(builder: (
    BuildContext context,
    Widget child,
    GlolbModel model,
    )
    {


      settingList = tabs.map((Tab tab) {
        return AddressSettingWidgetDetial(addressModel: model.userAddressInfo,);
      }).toList();

      return
        Container(


            child: Column(

              children: <Widget>[
                Container(
                  alignment: Alignment(1, 0),
                  height: 40.0,
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: tabs,
                    controller: tabController,
                  ),
                ),

                Container(
                  height: 444,
                  child: TabBarView(
                    controller: tabController,
                    children: settingList,
                  ),
                ),

              ],
            )

        );
    });
  }
}












class AddressSettingWidgetDetial extends StatefulWidget {
  UserAddressInfo addressModel;

  AddressSettingWidgetDetial({this.addressModel}) {}

  TextEditingController textEditingControllerFirstName =
  TextEditingController();

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

    widget.textEditingControllerFirstName.text =
        widget.addressModel.firstName; //问题是每次点击修改按钮都会走这个
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
                    fillColor: MainColor.backgroundTextField,
                    labelText: "firstname",
//                      hintText: "firstname",
                  ),
                ),
                flex: 1,
              ),
              SizedBox(
                width: DP.getDP(8.0),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColor.backgroundTextField,
                    labelText: "lastname",
//                      hintText: "firstname",
                  ),
                ),
                flex: 1,
              )
            ],
          ),
          SizedBox(
            height: DP.getDP(28),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColor.backgroundTextField,
                    labelText: "street1",
//                      hintText: "firstname",
                  ),
                ),
                flex: 1,
              )
            ],
          ),
          SizedBox(
            height: DP.getDP(28),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 50,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: MainColor.backgroundTextField,
                        borderRadius: BorderRadius.circular(5)),
//                    width: 200,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdown1Value,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdown1Value = newValue;
                        });
                      },
                      items: <String>['Zero', 'One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '11112222233334444',
                                maxLines: 1,
                              ) //////DropdownButtonHideUnderline
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: DP.getDP(8.0),
              ),
              Expanded(
                flex: 50,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: MainColor.backgroundTextField,
                        borderRadius: BorderRadius.circular(5)),
//                    width: 200,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdown1Value,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdown1Value = newValue;
                        });
                      },
                      items: <String>['Zero', 'One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '11112222233334444',
                                maxLines: 1,
                              ) //////DropdownButtonHideUnderline
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Text(''),
              ),
            ],
          ),
          SizedBox(
            height: DP.getDP(28),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColor.backgroundTextField,
                    labelText: "cvv",
//                      hintText: "firstname",
                  ),
                ),
                flex: 104,
              ),
              SizedBox(
                width: DP.getDP(8.0),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColor.backgroundTextField,
                    labelText: "Zip",
//                      hintText: "firstname",
                  ),
                ),
                flex: 151,
              ),
              Expanded(
                flex: 46,
                child: Text(''),
              )
            ],
          ),
        ],
      ),
    );
  }
}
