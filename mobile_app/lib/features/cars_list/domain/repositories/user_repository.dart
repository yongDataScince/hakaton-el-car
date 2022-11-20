import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/register_car.dart';

abstract class CarsRepository {
  Future<Either<Failure, List<CarEntity>>> getCars(UserParams loginParams);

  Future<Either<Failure, void>> carRegister(CarRegParams carRegParams);
}
