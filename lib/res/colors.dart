
import 'package:flutter/material.dart';

const kCheckoutAmber50 = Color(0xFFFFF8E1);
const kCheckoutAmber100 = Color(0xFFFFECB3);
const kCheckoutAmber200 = Color(0xFFFFE082);
const kCheckoutAmber500 = Color(0xFFFFC107);
const kCheckoutAmber800 = Color(0xFFFF8F00);

const kCheckoutGrey50 = Color(0xFFE7E7E7);
const kCheckoutGrey100 = Color(0xFFF5F5F5);
const kCheckoutGrey200 = Color(0xFFEBE4CF);
const kCheckoutGrey800 = Color(0xFF545149);
const kCheckouBlack87 = Color(0xDE000000);

const kCheckoutRed500 = Color(0xFFF44336);
const kCheckoutErrorRed = Color(0xFFC5032B);




const kColorNav = Color(0xffFFD54F);

const kColorFontBlack1 = Color(0x99000000);
const kCarSelectNubColor =  Colors.black26;
const kseparatedLineColor =  Colors.black26;

const kCircularLineColor  =  Colors.black12;

const kcolorDeepMainColor = Color(0xFFFFA000);
//const kcolorOrange2 =Theme.of(context).dividerColor);
const kcolorMainColor =Color(0xFFFFD54F);


class MainColor{//

  static Color  lineSperaColor(BuildContext context){
    return Theme.of(context).dividerColor;
  }


  //0x99000000

  static Color get  textColorMiddle => Color(0x99000000);

  static Color get  textColorBlack => Color(0xDE000000);


  static Color  get borderColorLightDarkGary => Color(0x1F000000);


   static Color get backgroundTextField => Color.fromARGB(230,233, 236, 236);//255设置不透明  Colors.black12;//
  static Color get  deepMainColor => Color(0xFFFFA000);
  static Color  get deepVeryMainColor => Color(0xFFFF6F00);
  static Color  get mainColor => Color(0xFFFFD54F);
  static Color get lightMainColor => Color(0xFFFFF8E1);

}
