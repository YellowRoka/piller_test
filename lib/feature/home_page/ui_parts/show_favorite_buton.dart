import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';

class ShowFavoriteButton extends StatefulWidget {
  const ShowFavoriteButton({super.key});

  @override
  State<ShowFavoriteButton> createState() => _ShowFavoriteButtonState();
}

class _ShowFavoriteButtonState extends State<ShowFavoriteButton> {
  bool isFavoritesActive = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        state.maybeWhen(
          orElse: (){},
          update: (_,__) => isFavoritesActive = false,
        );
        return IconButton(
          onPressed: () => setState(
            () {
                isFavoritesActive = !isFavoritesActive;
                context.read<HomePageCubit>().activeteFovirites(isFavoritesActive);
              }
          ),
          icon: Icon(isFavoritesActive ? Icons.favorite : Icons.favorite_border),
        );
      },
    );
  }
}
