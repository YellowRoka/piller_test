import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';

class FavoriteMarkerButton extends StatefulWidget {
  final HomeDataModel       data;
  final List<HomeDataModel> favorites;

  const FavoriteMarkerButton({
    super.key,
    required this.data, 
    required this.favorites,
  });

  @override
  State<FavoriteMarkerButton> createState() => _FavoriteMarkerButtonState();
}

class _FavoriteMarkerButtonState extends State<FavoriteMarkerButton> {
  late bool isFavoritesActive;

  @override
  void initState() {
    super.initState();
    isFavoritesActive = widget.favorites.contains(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    isFavoritesActive = widget.favorites.contains(widget.data);
    return IconButton(
      onPressed: () => setState(
        () {
          isFavoritesActive = !isFavoritesActive;
          if(isFavoritesActive){
            context.read<HomePageCubit>().addToFavorites(widget.data);
          }
          else{
            context.read<HomePageCubit>().removeFromFavorites(widget.data);
          }
        }
      ),
      icon: Icon(isFavoritesActive ? Icons.favorite : Icons.favorite_border),
    );
  }
}
