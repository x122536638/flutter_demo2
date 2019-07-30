import 'package:flutter/material.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/page/shop_car_bug_agin.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'package:flutter_app_client/res/dp.dart';




class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}
class HomeWidgetState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  final List<Tab> tabs = <Tab>[
    new Tab(text: "1"),
    new Tab(text: "2"),
    new Tab(text: "3")
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(


      child: Column(

        children: <Widget>[
          Container(
            height: 40.0,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs,
              controller: _tabController,
            ),
          ),

          Container(
            height: 999,
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((Tab tab) {
                return AddressSettingWidgetDetial();
              }).toList(),
            ),
          ),

        ],
      )

    );
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
