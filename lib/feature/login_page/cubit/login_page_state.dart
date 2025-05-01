part of 'login_page_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState.initial({required AuthDataModel user}) = $InitialState;
  const factory LoginPageState.errorOnUserField(String? error)        = $ErrorOnUserFieldState;
  const factory LoginPageState.errorOnPasswordField(String? error)    = $ErrorOnPasswordFieldState;
  const factory LoginPageState.loading()           = $LoadingState;
  const factory LoginPageState.error(String error) = $ErrorState;
  const factory LoginPageState.loginSucces()       = $LoginSuccesState;
  const factory LoginPageState.changePage()        = $ChangePageState;
}
