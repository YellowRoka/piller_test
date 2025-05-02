import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';
import 'package:piller_test/feature/home_page/ui_parts/data_card.dart';

class SliverDataListBuilder extends StatelessWidget {
  final List<HomeDataModel>? data;
  final List<HomeDataModel>  favorites;


  const SliverDataListBuilder({
    super.key, 
    required this.data, 
    required this.favorites, 
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder( 
      itemCount:   data?.length ?? 0, 
      itemBuilder: (context, index) => DataCard(
        data:      data![index],
        favorites: favorites,
        onTap: () => context.read<HomePageCubit>().selectData(data![index].id), 
      ), 
    );
  }
}
