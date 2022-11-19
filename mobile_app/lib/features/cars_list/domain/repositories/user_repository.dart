import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';

abstract class CarsRepository {
  Future<Either<Failure, List<CarEntity>>> getCars(UserParams loginParams);
}
