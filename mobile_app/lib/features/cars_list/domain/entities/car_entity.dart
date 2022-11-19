import 'package:mobile_app/core/enums/body_type_enum.dart';

class CarEntity {
  final String id;
  final String ownerId;
  final String number;
  final String carBrand;
  final BodyType bodyType;
  final int enginePowerWt;
  final int enginePowerHp;
  final int batteryCapacity;
  final int releaseYear;
  final String bodyColor;
  final int weight;
  final List<String> photos;

  CarEntity({
    required this.id,
    required this.ownerId,
    required this.number,
    required this.carBrand,
    required this.bodyType,
    required this.enginePowerWt,
    required this.enginePowerHp,
    required this.batteryCapacity,
    required this.releaseYear,
    required this.bodyColor,
    required this.weight,
    required this.photos,
  });
}
