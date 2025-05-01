import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/home_service/home_data_api_service.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/data/service/home_service/model/main_response_data_model.dart';

@injectable
class HomeRepository {
  final HomeDataApiService homeDataApiService;

  HomeRepository(this.homeDataApiService);

  Stream<MainResponseDataModel?> get allDataStream            => homeDataApiService.dataListStream;
  Future<MainResponseDataModel?> get reloadLastDataListValues => homeDataApiService.dataListStream.first;
  Stream<HomeDataModel?>         get selectedDataStream       => homeDataApiService.selectedDataStream;


  Future<void> getAllData()                async => await homeDataApiService.getAllData();
  Future<void> getDataBy(int id)           async => await homeDataApiService.getDataBy(id);
  Future<void> getDataByName(String? name) async => await homeDataApiService.getDataByName(name??'');
}
