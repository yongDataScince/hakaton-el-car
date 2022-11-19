// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelfDataModel _$$_SelfDataModelFromJson(Map<String, dynamic> json) =>
    _$_SelfDataModel(
      email: json['email'] as String,
      name: json['name'] as String,
      familyName: json['family_name'] as String,
      patronymic: json['patronymic'] as String,
      passportNumber: json['passport_number'] as String,
      driverLicense: json['driver_license'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_SelfDataModelToJson(_$_SelfDataModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'family_name': instance.familyName,
      'patronymic': instance.patronymic,
      'passport_number': instance.passportNumber,
      'driver_license': instance.driverLicense,
      'password': instance.password,
    };
