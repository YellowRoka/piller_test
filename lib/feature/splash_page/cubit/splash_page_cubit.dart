import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/splash_service/splash_service.dart';
import 'package:piller_test/di/provider/providers.dart';
import 'package:piller_test/system/router/routes.dart';

part 'splash_page_state.dart';
part 'splash_page_cubit.freezed.dart';

@injectable
class SplashPageCubit extends Cubit<SplashPageState> {
  final SplashService splashService;

  SplashPageCubit(this.splashService) : super( 
    SplashPageState.initial()
  );

  Future<void> loadVideoLink() async {
    try {
      emit( SplashPageState.loadVideoLink(splashService.getSplashVideoLink) );
    } 
    catch (e) {
      log(e.toString());
      appRouterProvider.goToRouteWithReplace(Routes.errorPage);
    }
  }

  Future<void> stepNextPage() async {
    emit( const SplashPageState.goNextPage() );
    await appRouterProvider.goToRouteWithReplace(Routes.loginPage);
  }
  
}
