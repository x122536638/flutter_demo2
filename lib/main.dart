



import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_client/tool/EventBus.dart';
import 'package:flutter_app_client/tool/international/MQInternationalization.dart';
import 'package:flutter_app_client/page/welcome_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


var bus = new EventBus();

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MyApp(key:globalKey2));
}

// Locale localeQJ = Locale('zh', 'CN');



GlobalKey<MyAppState> globalKey2 =
new GlobalKey<MyAppState>();


class MyApp extends StatefulWidget {


  MyApp({Key key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}





class MyAppState extends State<MyApp> {
  // 供外部使用的_AppSetting实例，用于修改app的状态


  Locale locale = const Locale('zh', 'CN');


  changeLocal(Locale l){
    setState(() {
      locale = l;
    });
  }



  @override
  Widget build(BuildContext context) {




    return new MaterialApp(

      theme: ThemeData( primaryColor: Colors.amberAccent),
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],
//      locale: const Locale('en', 'US'),
      locale: locale,//如果修改这个 则用路由估计没问题

//      title: DemoLocalizations.of(context).titleBarTitle,//'Welcome to Flutter',
      home:
      new Builder(builder: (context){
        return  XHQLocalizations(
//

          child: XHQSTFW(),//页面转换是不是应该换这个child 而不应该用路由切换
          key: globalKey,
        );


      }),


    );
  }
}

//class MyApp extends StatelessWidget {
//
//
//}

class XHQSTFW extends StatefulWidget {
  //是否显示欢迎页


  @override
  _XHQSTFWState createState() => _XHQSTFWState();
}

class _XHQSTFWState extends State<XHQSTFW> {

  Widget toshowWidget;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bus.on("login", (arg) {
      // do something
//      Navigator.push
      setState(() {
        toshowWidget = arg;

      });
    });


  }



  @override
  Widget build(BuildContext context) {
    return Theme(

      data: //primaryColor   primarySwatch
      ThemeData(platform: TargetPlatform.iOS,
        primaryColor: Color(0xffFFD54F),
      ), //Colors.yellow[600] type 'Color' is not a subtype of type 'MaterialColor'
//      iconTheme: IconThemeData(color: Colors.teal),
      child:toshowWidget!=null ?toshowWidget:Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.star),
          title: Text(DemoLocalizations.of(context).titleBarTitle),

//          new Text('Welcome to meiqo.'),
        ),
        body: Center(
          child:
          MqWelcome(),
//            new Builder(builder: (BuildContext context){
//
//              print('$context   11111');
//
////              return  MqWelcome();
//            }),
//          MqWelcome(),
        ),
      ),


    );
  }
}

//国际化全局key

GlobalKey<_XHQLocalizationsState> globalKey =
new GlobalKey<_XHQLocalizationsState>();

//国际化widget

class XHQLocalizations extends StatefulWidget {
  final Widget child;

  XHQLocalizations({Key key, this.child}) : super(key: key);

  @override
  _XHQLocalizationsState createState() => _XHQLocalizationsState();
}

class _XHQLocalizationsState extends State<XHQLocalizations> {
  Locale locale = Locale('en');

  changeLocal(Locale l) {
    setState(() {
      locale = l;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      child: widget.child,
//      locale: locale,
    );
  }
}