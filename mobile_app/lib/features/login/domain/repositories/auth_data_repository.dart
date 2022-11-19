import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/features/login/domain/entities/auth_data_entity.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/domain/usecases/post_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthDataEntity>> login(LoginParams loginParams);

  Future<Either<Failure, AuthDataEntity>> register(
      RegisterParams registerParams);
}
