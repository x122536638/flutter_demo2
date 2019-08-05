import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_client/page/main_page.dart';
import 'package:flutter_app_client/tool/EventBus.dart';
import 'package:flutter_app_client/tool/international/MQInternationalization.dart';
import 'package:flutter_app_client/page/welcome_page.dart';
import 'package:flutter_app_client/tool/scoped_model/global_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app_client/res/colors.dart';

import 'generated/i18n.dart';

var bus = new EventBus();

ValueChanged<Locale> localeChange;

void main() {
  debugPaintSizeEnabled = false;
//  debugPaintSizeEnabled = true;

  runApp(new MyApp(key: globalKey2));
}

//与MyAppState 绑定的全局key
// globalKey2.currentState.changeLocal(Locale('zh'));  修改语言
GlobalKey<MyAppState> globalKey2 = new GlobalKey<MyAppState>();

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // 供外部使用的_AppSetting实例，用于修改app的状态

  Locale locale = const Locale('zh', 'CN');

  final model = GlolbModel();

  changeLocal(Locale l) {
    setState(() {
      locale = l;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainTheme = ThemeData(
        fontFamily: 'Rubik',
        primaryColor: kcolorMainColor,
//        primaryColorBrightness:MainColor.deepVeryMainColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: MainColor.backgroundTextField,
//          hoverColor: MainColor.deepVeryMainColor,

          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MainColor.deepVeryMainColor)),
        ));

    return ScopedModel<GlolbModel>(
      model: model,
      child: MaterialApp(
        theme: mainTheme,
        localizationsDelegates: [
          // 本地化的代理类
          GlobalMaterialLocalizations.delegate,

          GlobalWidgetsLocalizations.delegate,
//          DemoLocalizationsDelegate.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,

        locale: locale,
        ////自己制定默认语言  后面修改语言依赖这个locale变量
        routes: {
          "MainPage": (context) => MainPage(),
          "WelcomePage": (context) => MqWelcome(),

//              XHQLocalizations(
//                child: MqWelcome(), //
//                key: globalKey,
//              ),
        },
        initialRoute: 'WelcomePage',
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//
//
//}

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
