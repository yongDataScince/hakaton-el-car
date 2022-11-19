import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/core/usecases/usecase.dart';
import 'package:mobile_app/features/login/domain/entities/auth_data_entity.dart';
import 'package:mobile_app/features/login/domain/repositories/auth_data_repository.dart';

class PostLogin extends UseCaseWithParams<AuthDataEntity, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, AuthDataEntity>> call(LoginParams params) =>
      _repo.login(params);
}

class LoginParams {
  final String phone;
  final String password;

  LoginParams({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };
}
