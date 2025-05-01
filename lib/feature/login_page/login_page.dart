import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:piller_test/feature/login_page/cubit/login_page_cubit.dart';
import 'package:piller_test/feature/login_page/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<LoginPageCubit>(),
      child:  Scaffold(
        body: const LoginPageBody(),
      ),
    );
  }
}
