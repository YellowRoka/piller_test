import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';
import 'package:piller_test/feature/home_page/ui_parts/sliver_data_list_builder.dart';
import 'package:piller_test/feature/home_page/ui_parts/sliver_search_line.dart';
import 'package:piller_test/feature/home_page/ui_parts/sliver_message_card.dart';
import 'package:piller_test/feature/home_page/ui_parts/sliver_white_loader.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers:    <Widget>[
          
          SliverSearchLine(),

          SliverPadding(
            padding: const EdgeInsets.only(
              left:   10,
              right:  10,
              bottom: 10,
            ),
            sliver: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse:        ()        => SliverWhiteLoader(),
                  error:         (message) => SliverMessageCard( message: message, isRefeshEnabled: true ),
                  dataError:     (errMsg)  => SliverMessageCard( message: errMsg ),
                  missingData:   ()        => SliverMessageCard( message: LocaleKeys.noData.tr(context: context) ),
                  update:        (data, favs) => SliverDataListBuilder( data: data.results, favorites: favs ),
                  showFavorites: (favs) =>
                    ( favs.isEmpty )?
                    (SliverMessageCard( message: LocaleKeys.emptyList.tr(context: context) )):
                    (SliverDataListBuilder( data: favs, favorites: favs )),
                );
              },
            ),
          ),
        ]
      ),
    );
  }
}
