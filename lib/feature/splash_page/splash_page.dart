import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:piller_test/feature/splash_page/cubit/splash_page_cubit.dart';
import 'package:piller_test/feature/splash_page/splash_page_body.dart';
import 'package:piller_test/system/themes/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SplashPageCubit>(), 
      child:  const Scaffold(
        backgroundColor: splashBGColor,
        body:            SplashPageBody()
      )
    );
  }
}
