
import 'font.dart';



class Constant {
  // timer
  static const int COUNTDOWN_TIME = 10;
  static const int PRODUCT_COUNTDOWN_TIME = 30;
  static const int INTERVAL_TIME = 1;

  // text max length
  static const int MAX_CODE_LENGTH = 8;

  static const double BASE_WIDTH = 1920;
  static const double PHONE_WIDTH = 1920;
  //static const double PHONE_WIDTH = 748.6;

  static const double UNIT = PHONE_WIDTH / BASE_WIDTH;
  // When request server api, need take "token" as param
  static String TOKEN = "token";

  static const String END_WITH = '\t';

  static const String ITEM = "item";
  static const String TAX = "Tax";
  static const String SAVINGS = "Savings";
  static const String TOTAL = "Total";
  static const String EMPTY = "";
  static const String X ="x";

  static String LOGIN_FROME_TYPE = "loginFromType";

  static String LOGIN_TOKEN = "loginToken";
}




class NotifName{


  static const String userInfoChange = 'userInfoChange';

}