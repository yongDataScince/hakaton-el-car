import 'dart:developer';

import 'package:mobile_app/features/cars_list/data/models/car_model.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/services/http/rest_client.dart';

abstract class UserRemoteDataSource {
  Future<List<CarModel>> getCars(UserParams userParams);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final RestClient client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<List<CarModel>> getCars(UserParams userParams) async {
    try {
      log(userParams.toJson().toString());
    } catch (e) {
      log(e.toString());
    }
    final user = await client.getUser(userParams.phone);
    final List<CarModel> cars = [];
    for (var carId in user.carsIds) {
      final car = await client.getCar(carId);
      cars.add(car);
    }
    return cars;
  }
}
