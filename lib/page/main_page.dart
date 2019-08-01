import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/main.dart';
import 'package:flutter_app_client/page/shop_car_page.dart';
import 'package:flutter_app_client/page/user_page.dart';
import 'package:flutter_app_client/res/constant.dart';
import 'package:flutter_app_client/tool/international/MQInternationalization.dart';
import 'package:flutter_app_client/page/shop_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'orders_page.dart';
import 'package:flutter_app_client/res/colors.dart';

class MainPage extends StatefulWidget {
  @override

//  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  //
  TabController _tabController;
  PageController pageController = PageController(initialPage: 0);

  List tabs = ["新闻", "历史", "图片"];

//  List pages =['MainPageSub1','MainPageSub1','MainPageSub1'];//问题 这个报错啊
//  List pages =[MainPageSub1,MainPageSub1,MainPageSub1];//问题 这个报错啊
//  List pages = [MainPageSub1(), MainPageSub1(), MainPageSub1()];
  List pages = [ShopPage(), OrdersPage(), UserPage()];

  int _selectedIndex = 1;
  int _currentPageViewIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

    //在合适的地方把 用户名存到 沙盒里
//

//    xx();
  }

  xx() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('userName', '陈冠希');
  }

  @override
  Widget build(BuildContext context) {
    return buildCenter(context);
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Scaffold(
            key: _globalKey,
            appBar: AppBar(
                elevation:0,
              title: Text(DemoLocalizations.of(context).titleBarTitle),
//        Text("app name"),
//        leading: Icon(Icons.add),//这么加的话 侧拉效果就没了
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print('anniu 1');
//              Scaffold.of(context).openDrawer();//获取state的一种方法

                    _globalKey.currentState.openDrawer();
                  },

//
                );
              }),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
//        bottom: TabBar(controller: _tabController, tabs: getTabList()),
            ),
            drawer: new MyDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor:kCheckoutAmber50,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Shopping')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), title: Text('Orders')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school), title: Text('my meiqo')),
              ],
              currentIndex: _currentPageViewIndex,
              onTap: onTap, // _onItemTapped,
            ),
            body: new PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new Navigator(
                  initialRoute: 'home',
                  onGenerateRoute: (RouteSettings settings) {
                    WidgetBuilder builder;
                    switch (settings.name) {
                      case 'home':
                        builder = (BuildContext context) =>  pages[index];
                        break;
//                      case 'demo1':
//                        builder = (BuildContext context) =>  pages[index];
//                        break;
                      default:
                        throw new Exception('Invalid route: ${settings.name}');
                    }

                    return new MaterialPageRoute(builder: builder, settings: settings);
                  },
                );
//                    pages[index]; //这个报错啊
              },
              onPageChanged: _pageChange,
              controller: pageController,
              itemCount: tabs.length,
            ),

          ),
        ),
      ),
    );
  }

  List getTabList() {
    return tabs
        .map((e) => Tab(
              text: e,
            ))
        .toList();
  }

  void _onItemTapped(int value) {


    setState(() {
      _selectedIndex = value;
    });
  }

// bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1), curve: Curves.ease);
  }

  //切换pageview
  void _pageChange(int index) {
    setState(() {
      if (_currentPageViewIndex != index) {
        _currentPageViewIndex = index;
      }
    });
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name;

  getname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String strName = await prefs.get('userName');

    setState(() {
      name = strName;
    });
  }

  test(var a) {
    name = a;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getname();
    bus.on(NotifName.userInfoChange, test); //

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('MyDrawer dispose');
    bus.off(NotifName.userInfoChange, test);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
//                        "imgs/avatar.png",
                        "images/11.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  Text(
                    name != null ? name : 'mingzi',
//                    "Wendux",
//                      getname(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('修改用户名'),
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ChangeNickNameWidget();
                          });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('语言设置'),
                    onTap:
                        () {
                      showAlertDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Locale _locale = const Locale('zh', 'CH');

                  Locale localeOf = Localizations.localeOf(context);
                  print(localeOf);
                  //应该在这儿设置 语言为中文 ,但是 怎么设置呢
//               freeLocalizationStateKey.currentState.changeLocale(const Locale('zh',"CH"));
//               Localizations.localeOf(context) =  Locale('zh', 'CN');

                  globalKey2.currentState.changeLocal(Locale('zh'));
                  Navigator.of(context).pop();
                },
                child: Text('中文'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  globalKey2.currentState.changeLocal(Locale('en'));
                  Navigator.of(context).pop();
                },
                child: Text('English'),
              ),
            ],
          );
        });
  }
}

//class ChangeNickName
class ChangeNickNameWidget extends StatefulWidget {
  @override
  _ChangeNickNameWidgetState createState() => _ChangeNickNameWidgetState();
}

class _ChangeNickNameWidgetState extends State<ChangeNickNameWidget> {
  TextFormField textFormField;
  FlatButton button;
  TextEditingController controller = TextEditingController();

  bool button1Enable = false;

  @override
  Widget build(BuildContext context) {
    var widget = Container(
        child: SimpleDialog(
      title: Text('修改昵称'),
      children: <Widget>[
        SimpleDialogOption(
          child: textFormField = TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: "输入昵称"),
            validator: (String value) {
              return value != null ? null : '昵称不为空';
            },
          ),
//                            TextFormField(
//                              decoration: InputDecoration(
//                              labelText: "yonghuming",
//                              icon: Icon(Icons.person),
//                            ),
//                            validator:(String t){
//                            return t.trim().length>0?null:'用户名不能为空';
//                            },
        ),
        button = FlatButton(
          onPressed: !button1Enable
              ? null
              : () async {
                  //如何拿到textformFiled的问题 和是为合法用户名时候修改按钮的点击状态

                  SharedPreferences ins = await SharedPreferences.getInstance();

                  if (controller.text.length > 0) {
                    ins.setString('userName', controller.text);
                    Navigator.of(context).pop();
                    bus.emit(NotifName.userInfoChange, controller.text);
                  } else {
                    print("昵称长度为0");
                  }

                  setState(() {
//                  name = '渣渣辉';
                  });
                },
          child: Text("确定修改"),
        ),
      ],
    ));

    //写逻辑
    controller.addListener(() {
      print(controller.text);

      if (controller.text.length > 0) {
        button1Enable = true;
      } else {
        button1Enable = false;
      }
      setState(() {});
    });

    return widget;
  }
}
