import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/feature/details_page/details_page.dart';
import 'package:piller_test/feature/error_page/error_page.dart';
import 'package:piller_test/feature/home_page/home_page.dart';
import 'package:piller_test/feature/login_page/login_page.dart';
import 'package:piller_test/feature/splash_page/splash_page.dart';
import 'package:piller_test/system/router/fade_transtaion_builder.dart';
import 'package:piller_test/system/router/fade_transtaion_page.dart';
import 'package:piller_test/system/router/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@singleton
class AppRouter {
  
  Future<void> goToRoute(String routeName, {Object? extra} ) async =>
    await router.push(routeName, extra: extra);
  

  Future<void> goToRouteWithReplace(String routeName, {Object? extra} ) async {
    await router.pushReplacement(routeName, extra: extra);
  }
  
  void refresh()   => router.refresh();
  void goToError() => router.push(Routes.errorPage);
  void goBack()  { 
    if(router.canPop()) router.pop();
  }

  /*INFO: bug exist in go_router: when use pushReplacement, the animation work in only one case:
   *builder -> pageBuilder
   */

  final GoRouter router = GoRouter(
    navigatorKey:        _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation:     Routes.splashPage,
    routes:              <RouteBase>[

      GoRoute(
        path:        Routes.splashPage,
        builder:     (BuildContext context, GoRouterState state) => const FadeTransitionBuilder(child:SplashPage()),
        //pageBuilder: (BuildContext context, GoRouterState state) => const FadeTransitionPage<void>(child:SplashPage()),
        routes:      const <RouteBase>[],
      ),

      GoRoute(
        path:        Routes.loginPage,
       // builder:     (BuildContext context, GoRouterState state) => const FadeTransitionBuilder(child:LoginPage()),
        pageBuilder: (BuildContext context, GoRouterState state) => const FadeTransitionPage<void>(child: LoginPage()),
        routes:      const <RouteBase>[],
      ),

      GoRoute(
        path:        Routes.homePage,
        builder:     (BuildContext context, GoRouterState state) => FadeTransitionBuilder(child: const HomePage()),
        pageBuilder: (BuildContext context, GoRouterState state) => FadeTransitionPage<void>( child: const HomePage()),
        routes:      const <RouteBase>[],
      ),

      GoRoute(
        path:        Routes.detailsPage,
        builder:     (BuildContext context, GoRouterState state) => const FadeTransitionBuilder(child:DetailsPage()),
        pageBuilder: (BuildContext context, GoRouterState state) => const FadeTransitionPage<void>(child: DetailsPage()),
        routes:      const <RouteBase>[],
      ),

    ],

    errorPageBuilder: (context, state) => const NoTransitionPage<void>( child: ErrorPage() ),
  );
}
