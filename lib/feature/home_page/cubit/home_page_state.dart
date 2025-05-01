part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial()     = $InitialState;
  const factory HomePageState.loading()     = $LoadingState;
  const factory HomePageState.missingData() = $MissingDataState;
  const factory HomePageState.dataError(String errorMessage)     = $DataErrorState;
  const factory HomePageState.update(MainResponseDataModel data) = $UpdateState;
  const factory HomePageState.error(String? message)             = $ErrorState;
}
