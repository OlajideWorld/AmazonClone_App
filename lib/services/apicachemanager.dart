import 'package:amazon_clone/models/usermodel.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

class ApiCacheManager {
  Future isLoggin() async {
    var isloggin = await APICacheManager().isAPICacheKeyExist("");
    return isloggin;
  }

  Future<User?> getUserCredentials() async {
    var isloggin = await APICacheManager().isAPICacheKeyExist("");
    if (isloggin) {
      var userData = await APICacheManager().getCacheData("");
      return User.fromJson(userData.syncData);
    }
    return null;
  }

  Future storeUserData({required User user}) async {
    var cacheData = APICacheDBModel(key: "", syncData: user.toJson());
    return await APICacheManager().addCacheData(cacheData);
  }

  Future loggout() async {
    await APICacheManager().deleteCache("");
  }
}
