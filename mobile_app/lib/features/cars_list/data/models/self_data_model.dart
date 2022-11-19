import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/features/cars_list/domain/entities/self_data_entity.dart';

part 'self_data_model.freezed.dart';
part 'self_data_model.g.dart';

@freezed
class SelfDataModel extends SelfDataEntity with _$SelfDataModel {
  const factory SelfDataModel({
    required String email,
    required String name,
    @JsonKey(name: 'family_name') required String familyName,
    required String patronymic,
    @JsonKey(name: 'passport_number') required String passportNumber,
    @JsonKey(name: 'driver_license') required String driverLicense,
    required String password,
  }) = _SelfDataModel;

  factory SelfDataModel.fromJson(Map<String, Object?> json) =>
      _$SelfDataModelFromJson(json);
}
