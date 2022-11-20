import 'package:mobile_app/features/cars_list/domain/usecases/register_car.dart';
import 'package:mobile_app/services/http/rest_client.dart';

abstract class RegisterCarRemoteDataSource {
  Future<void> regCar(CarRegParams carRegParams);
}

class RegisterCarRemoteDataSourceImpl implements RegisterCarRemoteDataSource {
  final RestClient client;

  RegisterCarRemoteDataSourceImpl(this.client);

  @override
  Future<void> regCar(CarRegParams carRegParams) async {
    await client.regCar(carRegParams.toJson());
  }
}
