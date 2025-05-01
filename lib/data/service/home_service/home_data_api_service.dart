import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:piller_test/data/service/home_service/model/main_response_data_model.dart';
import 'package:rxdart/subjects.dart';

@singleton
class HomeDataApiService {
  
  String baseUrl      = dotenv.env['openApiUrl']??'';
  String caracterPath = dotenv.env['openApiBasePath']??'';

  BehaviorSubject<MainResponseDataModel?> dataListController     = BehaviorSubject.seeded(null);
  BehaviorSubject<HomeDataModel?>         selectedDataController = BehaviorSubject.seeded(null);

  Stream<MainResponseDataModel?> get dataListStream     => dataListController.stream;
  Stream<HomeDataModel?>         get selectedDataStream => selectedDataController.stream;

  Future<void> getAllData() async {
    final url      = Uri.https( baseUrl,caracterPath );
    final response = await http.get( url );
    final json     = jsonDecode( response.body );
    final data     = MainResponseDataModel.fromJson( json );
    dataListController.add( data );
  }

  Future<void> getDataBy(int id) async {
    final url      = Uri.https( baseUrl, '$caracterPath/$id' );
    final response = await http.get( url );
    final json     = jsonDecode( response.body );
    final data     = HomeDataModel.fromJson( json );
    selectedDataController.add( data );
  }

  Future<void> getDataByName(String name) async {
    final url      = Uri.https( baseUrl, caracterPath, {'name': name} );
    final response = await http.get( url );
    final json     = jsonDecode( response.body );
    final data     = MainResponseDataModel.fromJson( json );
    dataListController.add( data );
  }
}
