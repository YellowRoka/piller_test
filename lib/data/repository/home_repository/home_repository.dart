import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/favorites_service/favorite_service.dart';
import 'package:piller_test/data/service/home_service/home_data_api_service.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/data/service/home_service/model/main_response_data_model.dart';

@injectable
class HomeRepository {
  final HomeDataApiService homeDataApiService;
  final FavoriteService    favoriteService;

  HomeRepository(
    this.homeDataApiService,
    this.favoriteService
  );

  Stream<MainResponseDataModel?> get allDataStream            => homeDataApiService.dataListStream;
  Future<MainResponseDataModel?> get reloadLastDataListValues => homeDataApiService.dataListStream.first;
  Stream<HomeDataModel?>         get selectedDataStream       => homeDataApiService.selectedDataStream;

  Future<void> getAllData()                async => await homeDataApiService.getAllData();
  Future<void> getDataBy(int id)           async => await homeDataApiService.getDataBy(id);
  Future<void> getDataByName(String? name) async => await homeDataApiService.getDataByName(name??'');

  Stream<List<HomeDataModel>> get favoritesStream => favoriteService.favoritesStream;

  void addFavorite(HomeDataModel data)    => favoriteService.addFavorite(data);
  void removeFavorite(HomeDataModel data) => favoriteService.removeFavorite(data);
  void setFavoritesFlag(bool value)       => favoriteService.setFavoritesFlag(value);
  bool get getFavoriteFlag                => favoriteService.getFavoitesFlag;
  List<HomeDataModel> get actualFavorites => favoriteService.favoritesController.value;
}
