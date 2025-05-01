import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';

class ClearSearchButton extends StatelessWidget {
  final FocusNode        searchFocusNode;
  final SearchController searchController;

  const ClearSearchButton({super.key,
   required this.searchFocusNode, 
   required this.searchController
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:      const Icon(Icons.clear),
      iconSize:  35,
      onPressed: (){
        searchFocusNode.unfocus();
        context.read<HomePageCubit>().searchByName(null).then(
          (_) => searchController.clear()
        );
      }
    );
  }
}
