import 'dart:developer';

import 'package:mobile_app/features/cars_list/data/models/car_model.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/services/http/rest_client.dart';

abstract class CarsRemoteDataSource {
  Future<List<CarModel>> getCars(UserParams userParams);
}

class CarsRemoteDataSourceImpl implements CarsRemoteDataSource {
  final RestClient client;

  CarsRemoteDataSourceImpl(this.client);

  @override
  Future<List<CarModel>> getCars(UserParams userParams) async {
    final user = await client.getUser(userParams.phone);
    final List<CarModel> cars = [];
    for (var carId in user.carsIds) {
      final car = await client.getCar(carId);
      cars.add(car);
    }
    return cars;
  }
}
