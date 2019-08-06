import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_client/page/main_page.dart';
import 'package:flutter_app_client/res/font.dart';
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

  ThemeData _buildShrineTheme() {
//  final ThemeData base = ThemeData();//如果这个初始化 ,导致导航栏文字白色

    final base = ThemeData(
      fontFamily: MainFont.mainFontRegular,
    );
    return base.copyWith(
      primaryColor: kcolorMainColor,
      errorColor: kCheckoutErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      inputDecorationTheme: InputDecorationTheme(
        //设置tf的labeltext
        labelStyle: TextStyle(
          color: MainColor.textColorMiddle,
          fontFamily: MainFont.mainFontRegular,
        ),
        filled: true,
        fillColor: MainColor.backgroundTextField,
        focusedBorder: UnderlineInputBorder(
            //设置tf的选中下划线颜色
            borderSide: BorderSide(color: MainColor.deepVeryMainColor)),
      ),

//    inputDecorationTheme: InputDecorationTheme(
//      border: OutlineInputBorder(),
//    ),
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          overline: base.overline.copyWith(
            //
            fontFamily: MainFont.mainFontMedium,
            fontSize: 12.19,
            letterSpacing: 2.0,
            color: MainColor.textColorMiddle,
          ),
          headline: base.headline.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24.38,
//            letterSpacing: 1.25,
            color: MainColor.deepVeryMainColor,
            fontFamily: MainFont.mainFontMedium,
          ),
          title: base.title.copyWith(fontSize: 24.0),

          //TF 错误信息
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.19,
          ),

          //TF字体
          subhead: base.subhead.copyWith(
              color: MainColor.textColorBlack,
              fontFamily: MainFont.mainFontMedium),

          subtitle: base.subtitle.copyWith(
            fontSize: 16.26,
            letterSpacing: 0.15,
            color: MainColor.textColorBlack,
            fontFamily: MainFont.mainFontMedium,
          ),

          body1: base.body1.copyWith(
            fontSize: 14.22,
            letterSpacing: 0.25,
            color: MainColor.textColorBlack,
            fontFamily: MainFont.mainFontRegular,
          ),
          body2: base.body2.copyWith(
            fontSize: 14.22,
            letterSpacing: 0.25,
            color: MainColor.textColorMiddle,
            fontFamily: MainFont.mainFontRegular,
          ),
          button: TextStyle(
            fontSize: 14.22,
            letterSpacing: 1.25,
            color: MainColor.textColorMiddle,
            fontFamily: MainFont.mainFontMedium,
          ),
        )
        .apply(
//      fontFamily: 'Rubik-Medium',//如果上边的 body1或者title设置颜色 会被displayColor 覆盖
//      displayColor: MainColor.textColorMiddle,
//      bodyColor: MainColor.textColorMiddle,
            );
  }

  @override
  Widget build(BuildContext context) {
    final mainTheme = ThemeData(
        fontFamily: 'Rubik-Medium',
        primaryColor: kcolorMainColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: MainColor.backgroundTextField,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MainColor.deepVeryMainColor)),
        ));

    return ScopedModel<GlolbModel>(
      model: model,
      child: MaterialApp(
        theme: _buildShrineTheme(),
//        theme: mainTheme,

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

//final ThemeData _kCheckoutTheme = _buildCheckoutTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kCheckoutGrey800);
}

