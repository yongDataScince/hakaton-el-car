import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/exceptions.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/login/data/datasources/auth_data_remote_datasource.dart';
import 'package:mobile_app/features/login/domain/entities/auth_data_entity.dart';
import 'package:mobile_app/features/login/domain/repositories/auth_data_repository.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/domain/usecases/post_register.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataRemoteDataSource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, AuthDataEntity>> login(LoginParams loginParams) async {
    try {
      final response = await authRemoteDatasource.login(loginParams);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthDataEntity>> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
