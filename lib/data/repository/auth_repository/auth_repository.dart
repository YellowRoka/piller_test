import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/auth_service/auth_data_api_service.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:piller_test/data/service/data_store_service/data_store_service.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

@injectable
class AuthRepository {
  final AuthDataApiService _authDataApiService;
  final DataStoreService   _dataStoreService;

  AuthRepository(
    this. _authDataApiService, 
    this. _dataStoreService
  );

  AuthDataModel get getTempCollectedUserData => _dataStoreService.getTempCollectedUserData;

  Future<void> userDataChanged(AuthDataModel user) async => await _dataStoreService.setTempUserData(user);

  Future<String?> login() async {
    AuthDataModel collectedUserData = _dataStoreService.getTempCollectedUserData;
    String?       result            = await _authDataApiService.login( collectedUserData );

    if(result == null){ 
      await _dataStoreService.saveActiveUserDetails(); 
    }
    
    return result;
  }

  Future<String?> chechUserName() async {
    final userName = _dataStoreService.getTempCollectedUserData.userName;
    if( userName == null || userName == "" ){ return LocaleKeys.emptyField.tr();    }
    if( userName.length < 4                ){ return LocaleKeys.shortUserName.tr(); }  
    return null;
  }

  Future<String?> chechPassword() async {
    final password = _dataStoreService.getTempCollectedUserData.password;
    if( password == null || password == ""   ){ return LocaleKeys.emptyField.tr();    }
    if( password.length < 4                  ){ return LocaleKeys.shortPassword.tr(); }
    if( !RegExp(r'[A-Z]').hasMatch(password) ){ return LocaleKeys.capitalLetter.tr(); }
    return null;
  }
}
