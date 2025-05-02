import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/repository/home_repository/home_repository.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/data/service/home_service/model/main_response_data_model.dart';
import 'package:piller_test/di/provider/providers.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/router/routes.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final HomeRepository homeRepository;

  late StreamSubscription<MainResponseDataModel?> _allDataSubscription;
  late StreamSubscription<List<HomeDataModel>?>   _favoritesSubscription;

  @override
  Future<void> close() {
    _allDataSubscription.cancel();
    _favoritesSubscription.cancel();
    return super.close();
  }

  HomePageCubit(this.homeRepository) : super( HomePageState.initial() ){
    _subbscribeForAllDataStream();
    getAllData();
  }

  Future<void> getAllData() async {
    emit( HomePageState.loading() );
    await homeRepository.getAllData().catchError( (e) => _errorCatcher(e) );
  }

  Future<void> selectData(int? id) async {
    emit( HomePageState.loading() );
    ( null == id                                            )?
    ( emit(HomePageState.error(LocaleKeys.idNotExist.tr())) ):
    ( _tryOpenSelectedData(id)                              );
  }
  
  Future<void> searchByName(String? name) async {
    emit( HomePageState.loading() );
    homeRepository.setFavoritesFlag(false);
    await homeRepository.getDataByName(name).catchError( (e) => _errorCatcher(e) );
  }

  void _subbscribeForAllDataStream(){
    _allDataSubscription = homeRepository.allDataStream.listen(
      (data) {
        if( null == data            ){ emit( HomePageState.missingData() );           }
        else if( null != data.error ){ emit( HomePageState.dataError(data.error!) );  }
        
        else{ 
          final favorites = homeRepository.actualFavorites;
          emit( HomePageState.update(data, favorites) ); 
        }
      },
    );

    _favoritesSubscription = homeRepository.favoritesStream.listen(
      (favorites) => HomePageState.showFavorites(favorites)
    );
  }

  Future<void> _tryOpenSelectedData(int id) async {
    try{
      await homeRepository.getDataBy(id);
      await appRouterProvider.goToRoute(Routes.detailsPage);
      if(homeRepository.getFavoriteFlag){
        final List<HomeDataModel> favorites = homeRepository.actualFavorites;
        emit( HomePageState.showFavorites(favorites) );
      }
      else{
        _restoreDataListProcess();
      }

    }
    catch(e){
      _errorCatcher(e as Exception);
    }
  }

  Future<void> _restoreDataListProcess() async {
    homeRepository.reloadLastDataListValues.then( 
      (data) {
        ( null == data                      )?
        ( emit(HomePageState.missingData()) ):
        ( emit(HomePageState.update(data, homeRepository.actualFavorites))  );
      } 
    );
  }

  void _errorCatcher(Exception e){
    log(e.toString());
    appRouterProvider.goToError();
    emit( HomePageState.error( LocaleKeys.internetNotAvailable.tr() ) );
  }

  void activeteFovirites(bool isActive){
    emit( HomePageState.loading() );
    homeRepository.setFavoritesFlag(isActive);
    if( isActive ){
      final List<HomeDataModel> favorites = homeRepository.actualFavorites;
      emit( HomePageState.showFavorites(favorites) );
    }
    else{
      _restoreDataListProcess();
    }
  }

  void addToFavorites(HomeDataModel data) {
    if(null == data.id){ return; }

    homeRepository.addFavorite(data);
    if(homeRepository.getFavoriteFlag){ 
      emit( HomePageState.loading() );
      final List<HomeDataModel> favorites = homeRepository.actualFavorites;
      emit( HomePageState.showFavorites(favorites) );
    }
  }
  
  void removeFromFavorites(HomeDataModel data) {
    if(null == data.id){ return; }

    homeRepository.removeFavorite(data);
    if(homeRepository.getFavoriteFlag){
      emit( HomePageState.loading() );
      final List<HomeDataModel> favorites = homeRepository.actualFavorites;
      emit( HomePageState.showFavorites(favorites) );
    }
  }
}
