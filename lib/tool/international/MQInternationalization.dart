import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {

  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'task title': 'Flutter Demo',
      'titlebar title': 'welome to mq',
      'click tip': 'You have pushed the button this many timesYou have pushed the button this many timesYou have pushed the button this many times:',
      'inc':'Increment'
    },
    'zh': {
      'task title': 'Flutter 示例',
      'titlebar title': '欢迎来到mq',
      'click tip': '你一共点击了这么多次按钮你一共点击了这么多次按钮你一共点击了这么多次按钮你一共点击了这么多次按钮你一共点击了这么多次按钮：',
      'inc':'增加'
    }


  };

  get taskTitle{
    return _localizedValues[locale.languageCode]['task title'];
  }

  get titleBarTitle{
    return _localizedValues[locale.languageCode]['titlebar title'];
  }

  get clickTop{
    return _localizedValues[locale.languageCode]['click tip'];
  }

  get inc{
    return _localizedValues[locale.languageCode]['inc'];
  }


  //此处
  static DemoLocalizations of(BuildContext context){
    return Localizations.of(context, DemoLocalizations);
  }
}




class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>{

  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return new SynchronousFuture<DemoLocalizations>(new DemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

  static DemoLocalizationsDelegate delegate = const DemoLocalizationsDelegate();
}