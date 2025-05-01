import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';

part 'main_response_data_model.freezed.dart';
part 'main_response_data_model.g.dart';

@freezed
abstract class MainResponseDataModel with _$MainResponseDataModel {
  const factory MainResponseDataModel({
    required String?              error,
    required Info?                info,
    required List<HomeDataModel>? results,
  }) = _MainResponseDataModel;

factory MainResponseDataModel.fromJson(Map<String, dynamic> json) => _$MainResponseDataModelFromJson(json);
}

@freezed
abstract class Info with _$Info {
  const factory Info({
    required int?    count,
    required int?    pages,
    required String? next,
    required String? prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}
