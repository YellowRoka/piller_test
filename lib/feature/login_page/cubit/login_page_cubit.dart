import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/repository/auth_repository/auth_repository.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:piller_test/di/provider/providers.dart';
import 'package:piller_test/system/router/routes.dart';

part 'login_page_state.dart';
part 'login_page_cubit.freezed.dart';

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  final AuthRepository authRepository;
  
  LoginPageCubit(this.authRepository) : super(
    LoginPageState.initial(
      user: authRepository.getTempCollectedUserData
    ),
  );

  Future<void> passwordChanged(String? value) async {
    AuthDataModel tempUser = authRepository.getTempCollectedUserData;

    tempUser = tempUser.copyWith(password: value);
    await authRepository.userDataChanged(tempUser);
    emit( LoginPageState.errorOnPasswordField(null) );
  }

  Future<void> userNameChanged(String? value) async {
    AuthDataModel tempUser = authRepository.getTempCollectedUserData;

    tempUser = tempUser.copyWith(userName: value);
    await authRepository.userDataChanged(tempUser);
    emit( LoginPageState.errorOnUserField(null) );
  }

  Future<void> login() async {
    emit ( LoginPageState.loading() );

    final userNameErrorResult = await _chechUserNameProcess();
    final passwordErrorResult = await _chechPasswordProcess();

    if( 
      userNameErrorResult == null &&
      passwordErrorResult == null
     ){
      await _loginProcess();
    }
  }

  Future<String?> _chechUserNameProcess() async {
    String? userNameErrorResult = await authRepository.chechUserName();
    if( null != userNameErrorResult ){ 
      emit( LoginPageState.errorOnUserField(userNameErrorResult) ); 
    }
    return userNameErrorResult;
  }

  Future<String?> _chechPasswordProcess() async {
    String? passwordErrorResult = await authRepository.chechPassword();
    if( null != passwordErrorResult ){ 
      emit( LoginPageState.errorOnPasswordField(passwordErrorResult) );
    }
    return passwordErrorResult;
  }

  Future<void> _loginProcess() async {
    String? result = await authRepository.login();
    if( null != result ) { 
      emit( LoginPageState.error(result) );
    }
    else{
      emit( LoginPageState.loginSucces() );
      await appRouterProvider.goToRoute(Routes.homePage);
      emit( LoginPageState.changePage() );
    }
  }
}
