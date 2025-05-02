part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial()     = $InitialState;
  const factory HomePageState.loading()     = $LoadingState;
  const factory HomePageState.missingData() = $MissingDataState;
  const factory HomePageState.dataError(String errorMessage)               = $DataErrorState;
  const factory HomePageState.error(String? message)                       = $ErrorState;
  const factory HomePageState.showFavorites(List<HomeDataModel> favorites) = $ShowFavoritesState;
  const factory HomePageState.update(MainResponseDataModel data, List<HomeDataModel>  favorites) = $UpdateState;
}
