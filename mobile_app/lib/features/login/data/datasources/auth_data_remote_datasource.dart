import 'package:mobile_app/features/login/data/models/auth_data_model.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/domain/usecases/post_register.dart';
import 'package:mobile_app/services/http/rest_client.dart';

abstract class AuthDataRemoteDataSource {
  Future<AuthDataModel> login(LoginParams loginParams);
  Future<AuthDataModel> register(RegisterParams registerParams);
}

class AuthDataRemoteDataSourceImpl implements AuthDataRemoteDataSource {
  final RestClient client;

  AuthDataRemoteDataSourceImpl(this.client);

  @override
  Future<AuthDataModel> login(LoginParams loginParams) async {
    AuthDataModel authData = await client.login(loginParams.toJson());
    return authData;
  }

  @override
  Future<AuthDataModel> register(RegisterParams registerParams) async {
    final authData = await client.register(registerParams.toJson());
    return authData;
  }
}
