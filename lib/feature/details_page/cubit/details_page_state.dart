part of 'details_page_cubit.dart';

@freezed
class DetailsPageState with _$DetailsPageState {
  const factory DetailsPageState.initial()                      = $InitialState;
  const factory DetailsPageState.error()                        = $ErrorState;
  const factory DetailsPageState.update(HomeDataModel details)  = $UpdateState;
}
