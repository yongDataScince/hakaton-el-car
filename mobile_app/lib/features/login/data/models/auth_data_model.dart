import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/features/login/domain/entities/auth_data_entity.dart';

part 'auth_data_model.freezed.dart';
part 'auth_data_model.g.dart';

@freezed
class AuthDataModel extends AuthDataEntity with _$AuthDataModel {
  const factory AuthDataModel({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _AuthDataModel;

  factory AuthDataModel.fromJson(Map<String, Object?> json) =>
      _$AuthDataModelFromJson(json);
}
