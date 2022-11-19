import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/core/enums/body_type_enum.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@freezed
class CarModel extends CarEntity with _$CarModel {
  const factory CarModel({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String number,
    @JsonKey(name: 'car_brand') required String carBrand,
    @JsonKey(name: 'body_type') required BodyType bodyType,
    @JsonKey(name: 'engine_power_wt') required int enginePowerWt,
    @JsonKey(name: 'engine_power_hp') required int enginePowerHp,
    @JsonKey(name: 'battery_capacity') required int batteryCapacity,
    @JsonKey(name: 'release_year') required int releaseYear,
    @JsonKey(name: 'body_color') required String bodyColor,
    required int weight,
    required List<String> photos,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, Object?> json) =>
      _$CarModelFromJson(json);
}
