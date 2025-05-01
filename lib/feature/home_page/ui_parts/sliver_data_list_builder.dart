import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/data/service/home_service/model/main_response_data_model.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';
import 'package:piller_test/feature/home_page/ui_parts/data_card.dart';

class SliverDataListBuilder extends StatelessWidget {
  final MainResponseDataModel  data;
  
  const SliverDataListBuilder({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder( 
      itemCount:   data.results?.length ?? 0, 
      itemBuilder: (context, index) => DataCard(
        data:  data.results![index],
        onTap: () => context.read<HomePageCubit>().selectData(data.results![index].id), 
      ), 
    );
  }
}
