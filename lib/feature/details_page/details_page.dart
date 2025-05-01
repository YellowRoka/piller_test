import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:piller_test/feature/details_page/cubit/details_page_cubit.dart';
import 'package:piller_test/feature/details_page/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DetailsPageCubit>(), 
      child:   const Scaffold(
        body:   DetailsPageBody()
      )
    );
  }
}
