import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/auth_service/auth_data_api_service.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:piller_test/data/service/data_store_service/data_store_service.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

@injectable
class AuthRepository {
  final AuthDataApiService authDataApiService;
  final DataStoreService   dataStoreService;

  AuthRepository(
    this.authDataApiService, 
    this.dataStoreService
  );

  Future<void> userDataChanged(AuthDataModel user) async => await dataStoreService.setTempUserData(user);

  Future<String?> login() async {
    AuthDataModel collectedUserData = dataStoreService.getTempCollectedUserData;
    String?       result            = await authDataApiService.login( collectedUserData );

    if(result == null){ 
      await dataStoreService.saveActiveUserDetails(); 
    }
    
    return result;
  }

  Future<String?> chechUserName() async {
    final userName = dataStoreService.getTempCollectedUserData.userName;
    if( userName == null || userName == "" ){ return LocaleKeys.emptyField.tr();    }
    if( userName.length < 4                ){ return LocaleKeys.shortUserName.tr(); }  
    return null;
  }

  Future<String?> chechPassword() async {
    final password = dataStoreService.getTempCollectedUserData.password;
    if( password == null || password == ""   ){ return LocaleKeys.emptyField.tr();    }
    if( password.length < 4                  ){ return LocaleKeys.shortPassword.tr(); }
    if( !RegExp(r'[A-Z]').hasMatch(password) ){ return LocaleKeys.capitalLetter.tr(); }
    return null;
  }
}
