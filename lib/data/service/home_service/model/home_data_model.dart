import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data_model.freezed.dart';
part 'home_data_model.g.dart';

@freezed
abstract class HomeDataModel with _$HomeDataModel {
  const factory HomeDataModel({
    required int?                  id,
    required String?               name,
    required String?               status,
    required String?               species,
    required String?               type,
    required String?               gender,
    required Map<String, dynamic>? origin,
    required Map<String, dynamic>? location,
    required String?               image,
    required List<String>?         episode,
    required String?               url,
    required DateTime?             created,

  }) = _HomeDataModel;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);
}
