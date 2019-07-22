
class RequestCode {
// base request url
  //static const String BASE_URL = "http://52.14.224.65:8081/api/v1";
  static const String BASE_URL = "http://192.168.31.67:8081/api/v1";
  static const String BASE_PIC_URL = "https://storage.googleapis.com/new-meiqo/goodsImg/";


// login url
  static const String LOGIN = "/login";
  static const String GET_GOODS_BY_BARCODE = "/getGoodsByBarCode";
  static const String GET_GOODS_BY_NAME = "/getGoodsByName";
  // generate order by param[goodsIds, customerId, type]
  static const String GENERATE_ORDER = "/generateOrder";
}