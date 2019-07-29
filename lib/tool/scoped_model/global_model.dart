




import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:flutter_app_client/model/user_address_info.dart';
import 'package:scoped_model/scoped_model.dart';

class GlolbModel extends Model
    with
        BaseModel,
        UserAddressInfoModel
{

  GlolbModel();
}
 class BaseModel extends Model{}
class UserAddressInfoModel extends BaseModel{

  UserAddressInfo _info = UserAddressInfo();

  get userAddressInfo =>_info;


  void changeUserAddressInfo(UserAddressInfo newInfo){
    _info= newInfo;
    notifyListeners();
  }


//  UserAddressInfoModel of(context) =>ScopedModel.of<UserAddressInfoModel>(context);
}





class CountModel extends Model with AA {
  int _count = 0;
  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  CountModel of(context) => ScopedModel.of<CountModel>(context);
}

class AA {
  String text = 'haha';
}