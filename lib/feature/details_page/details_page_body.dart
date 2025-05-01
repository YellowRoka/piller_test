import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/details_page/cubit/details_page_cubit.dart';
import 'package:piller_test/feature/details_page/ui_parts/detailed_data_card.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DetailsPageCubit, DetailsPageState>(
        builder: (context, state) {
          return state.when(
            initial: ()     => const Center( child: CircularProgressIndicator() ),
            update:  (data) => DetailedDataCard( data: data ),
            error:   ()     => Center(
              child: Card(
                child: Text(
                  LocaleKeys.noData.tr( context: context )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
