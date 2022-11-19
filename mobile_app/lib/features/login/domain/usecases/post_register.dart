import 'package:dartz/dartz.dart';
import 'package:mobile_app/core/errors/failure.dart';
import 'package:mobile_app/core/usecases/usecase.dart';
import 'package:mobile_app/features/login/domain/entities/auth_data_entity.dart';
import 'package:mobile_app/features/login/domain/repositories/auth_data_repository.dart';

class PostRegister extends UseCaseWithParams<AuthDataEntity, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, AuthDataEntity>> call(RegisterParams params) =>
      _repo.register(params);
}

class RegisterParams {
  final String phone;
  final String password;

  RegisterParams({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };
}
