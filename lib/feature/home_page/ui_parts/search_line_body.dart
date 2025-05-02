import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';
import 'package:piller_test/feature/home_page/ui_parts/clear_search_button.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/themes/app_colors.dart';

class SearchLineBody extends StatelessWidget {
  final FocusNode        searchFocusNode;
  final SearchController searchController;

  const SearchLineBody({
    super.key, 
    required this.searchFocusNode, 
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: CupertinoTextField(
        placeholder:      LocaleKeys.search.tr(context: context),
        placeholderStyle: const TextStyle(color: textColor),
        controller:       searchController,
        focusNode:        searchFocusNode,
        onChanged:        (value) =>context.read<HomePageCubit>().searchByName(value),
        decoration:       BoxDecoration(
          borderRadius: const BorderRadius.all( Radius.circular(10) ),
          border:       Border.all( 
            color: searcBorderColor,
            width: 2
          ),
        ),
        suffix: ClearSearchButton(
          searchController: searchController,
          searchFocusNode:  searchFocusNode
        ),
      ),
    );
  }
}
