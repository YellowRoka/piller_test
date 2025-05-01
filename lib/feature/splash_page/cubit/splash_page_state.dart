part of 'splash_page_cubit.dart';

@freezed
sealed class SplashPageState with _$SplashPageState {
  const factory SplashPageState.initial()    = $InitialState;
  const factory SplashPageState.goNextPage() = $GoNextPageState;
  const factory SplashPageState.loadVideoLink(String videoLink) = $LoadVideoLinkState;
}
