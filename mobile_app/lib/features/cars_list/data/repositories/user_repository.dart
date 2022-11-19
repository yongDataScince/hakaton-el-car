import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/exceptions.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/cars_list/data/datasources/user_remote_data_source.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/repositories/user_repository.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';

class CarsRepositoryImpl implements CarsRepository {
  final CarsRemoteDataSource userRemoteDatasource;

  const CarsRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, List<CarEntity>>> getCars(
      UserParams userParams) async {
    try {
      final response = await userRemoteDatasource.getCars(userParams);
      return Right(response);
    } on ServerException catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
