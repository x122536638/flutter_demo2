// font size
import 'package:flutter_app_client/res/dp.dart';

import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_client/res/colors.dart';
import 'dp.dart';

const double fFontSize14 = 14 * Constant.UNIT;
const double fFontSize16 = 16 * Constant.UNIT;
const double fFontSize18 = 18 * Constant.UNIT;
const double fFontSize20 = 20 * Constant.UNIT;
const double fFontSize24 = 24 * Constant.UNIT;
const double fFontSize34 = 34 * Constant.UNIT;
const double fFontSize48 = 48 * Constant.UNIT;

// icon size

const double iIconSize40 = 40 * Constant.UNIT;
const double iIconSize60 = 60 * Constant.UNIT;
const double iIconSize80 = 80 * Constant.UNIT;


//TextStyle(
//fontSize: DP.bigFontSize,
//color: MainColor.textColorBlack),
//)

class MainFont{

  static  TextStyle userSettingTextStyle =  TextStyle(

   fontSize: DP.getDP(20.35),
      color: MainColor.textColorBlack,
      fontWeight: FontWeight.w900,

  );

  static  TextStyle orders_totalPriceStyle =  TextStyle(

    fontSize: DP.getDP(16.35),
    color: MainColor.textColorBlack,
    fontWeight: FontWeight.w900,

  );



}