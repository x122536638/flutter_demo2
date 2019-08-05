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

  @override
  Widget build(BuildContext context) {

     ThemeData _kCheckoutTheme = _buildCheckoutTheme();
    final mainTheme = ThemeData(
        fontFamily: 'Rubik-Medium',
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
        theme: _kCheckoutTheme,
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

ThemeData _buildCheckoutTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    colorScheme: kCheckoutColorScheme,
    accentColor: kCheckouBlack87,
    primaryColor: kcolorMainColor,
    buttonColor: kCheckoutAmber500,
    scaffoldBackgroundColor: Colors.white,
    cardColor: kCheckoutAmber50,
    textSelectionColor: kCheckoutAmber100,
    errorColor: kCheckoutErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kCheckoutColorScheme,
      textTheme: ButtonTextTheme.normal,
      buttonColor: kCheckoutAmber100,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
//    inputDecorationTheme:
//    const InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildCheckoutTextTheme(base.textTheme),
    primaryTextTheme: _buildCheckoutTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCheckoutTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildCheckoutTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline: base.headline.copyWith(fontWeight: FontWeight.w500),
    title: base.title.copyWith(fontSize: fFontSize20),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: fFontSize14,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: fFontSize16,
    ),
//    button: base.button.copyWith(
//      fontWeight: FontWeight.w700,
//      fontSize: fFontSize24,
//    ),
  )
      .apply(
    fontFamily: 'Rubik-Medium',
    displayColor: kCheckoutGrey800,
    bodyColor: kCheckoutGrey800,
  );
}

const ColorScheme kCheckoutColorScheme = ColorScheme(
  primary: kcolorMainColor,
  primaryVariant: kcolorMainColor,
  secondary: kCheckoutAmber50,
  secondaryVariant: kCheckoutGrey800,
  surface: kCheckoutGrey50,
  background: kCheckoutAmber50,
  error: kCheckoutErrorRed,
  onPrimary: kCheckoutGrey800,
  onSecondary: kCheckoutGrey800,
  onSurface: kCheckoutGrey800,
  onBackground: kCheckoutGrey800,
  onError: kCheckoutGrey50,
  brightness: Brightness.light,
);
