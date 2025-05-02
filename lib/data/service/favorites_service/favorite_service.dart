import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:rxdart/subjects.dart';

@singleton
class FavoriteService {

  BehaviorSubject<List<HomeDataModel>>favoritesController = BehaviorSubject.seeded([]);

  Stream<List<HomeDataModel>> get favoritesStream  => favoritesController.stream;

  bool _showFavorites = false;

  void addFavorite(HomeDataModel data) {
    List<HomeDataModel> favorites = favoritesController.value;
    if( ! favorites.contains(data) ){
      favorites.add(data);
      favoritesController.add(favorites);
    }
  }

  void removeFavorite(HomeDataModel data) {
    List<HomeDataModel> favorites = favoritesController.value;
    if( favorites.contains(data) ){ 
      favorites.remove(data);
      favoritesController.add(favorites);
    }
  }

  bool get getFavoitesFlag => _showFavorites;
  void setFavoritesFlag(bool value) => _showFavorites = value;
}
