import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:piller_test/feature/error_page/cubit/error_page_cubit.dart';
import 'package:piller_test/feature/error_page/error_body.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ErrorPageCubit>(),
      child:  Scaffold(
        body: ErrorBody()
      ),
    );
  }
}
