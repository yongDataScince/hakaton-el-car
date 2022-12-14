import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/exceptions.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/cars_list/data/datasources/register_car_datasource.dart';
import 'package:mobile_app/features/cars_list/data/datasources/user_remote_data_source.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/repositories/user_repository.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/register_car.dart';

class CarsRepositoryImpl implements CarsRepository {
  final CarsRemoteDataSource userRemoteDatasource;
  final RegisterCarRemoteDataSource registerCarRemoteDataSource;

  const CarsRepositoryImpl(
    this.userRemoteDatasource,
    this.registerCarRemoteDataSource,
  );

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

  @override
  Future<Either<Failure, void>> carRegister(CarRegParams carRegParams) async {
    try {
      final response = await registerCarRemoteDataSource.regCar(carRegParams);
      return Right(response);
    } on ServerException catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
