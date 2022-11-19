import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/core/usecases/usecase.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/repositories/user_repository.dart';

class GetCars extends UseCaseWithParams<List<CarEntity>, UserParams> {
  final CarsRepository _repo;

  GetCars(this._repo);

  @override
  Future<Either<Failure, List<CarEntity>>> call(UserParams params) =>
      _repo.getCars(params);
}

class UserParams {
  final String phone;

  UserParams({
    required this.phone,
  });

  Map<String, String> toJson() => {
        "phone": phone,
      };
}
