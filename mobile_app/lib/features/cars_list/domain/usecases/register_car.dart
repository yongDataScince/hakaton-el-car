import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/core/usecases/usecase.dart';
import 'package:mobile_app/features/cars_list/domain/repositories/user_repository.dart';

class RegisterCar extends UseCaseWithParams<void, CarRegParams> {
  final CarsRepository _repo;

  RegisterCar(this._repo);

  @override
  Future<Either<Failure, void>> call(CarRegParams params) =>
      _repo.carRegister(params);
}

class CarRegParams {
  final String accessToken;
  final String ownerId;
  final String number;
  final String carBrand;
  final String bodyType;
  final int enginePowerWt;
  final int enginePowerHp;
  final int batteryCapacity;
  final int releaseYear;
  final String bodyColor;
  final int weight;
  final List<String> photos;

  CarRegParams({
    required this.accessToken,
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

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "owner_id": ownerId,
        "number": number,
        "car_brand": carBrand,
        "body_type": bodyType,
        "engine_power_wt": enginePowerWt,
        "engine_power_hp": enginePowerHp,
        "battery_capacity": batteryCapacity,
        "release_year": releaseYear,
        "body_color": bodyColor,
        "weight": weight,
        "photos": ["1", "2", "3", "4"],
      };
}
