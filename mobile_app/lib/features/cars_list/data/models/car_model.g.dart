// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CarModel _$$_CarModelFromJson(Map<String, dynamic> json) => _$_CarModel(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      number: json['number'] as String,
      carBrand: json['car_brand'] as String,
      bodyType: $enumDecode(_$BodyTypeEnumMap, json['body_type']),
      enginePowerWt: json['engine_power_wt'] as int,
      enginePowerHp: json['engine_power_hp'] as int,
      batteryCapacity: json['battery_capacity'] as int,
      releaseYear: json['release_year'] as int,
      bodyColor: json['body_color'] as String,
      weight: json['weight'] as int,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CarModelToJson(_$_CarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'number': instance.number,
      'car_brand': instance.carBrand,
      'body_type': _$BodyTypeEnumMap[instance.bodyType]!,
      'engine_power_wt': instance.enginePowerWt,
      'engine_power_hp': instance.enginePowerHp,
      'battery_capacity': instance.batteryCapacity,
      'release_year': instance.releaseYear,
      'body_color': instance.bodyColor,
      'weight': instance.weight,
      'photos': instance.photos,
    };

const _$BodyTypeEnumMap = {
  BodyType.hatchback: 'Hatchback',
  BodyType.sedan: 'Sedan',
  BodyType.muvsuv: 'MUVSUV',
  BodyType.coupe: 'Coupe',
  BodyType.convertible: 'Convertible',
  BodyType.jeep: 'Jeep',
  BodyType.van: 'Van',
};
