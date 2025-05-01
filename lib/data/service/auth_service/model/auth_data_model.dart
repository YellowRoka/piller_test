import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data_model.freezed.dart';
part 'auth_data_model.g.dart';

@freezed
abstract class AuthDataModel with _$AuthDataModel{
  const factory AuthDataModel({
    required String? userName,
    required String? password,
  }) = _AuthDataModel;

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => _$AuthDataModelFromJson(json);
}
