import 'package:mobile_app/core/constats/http_constants.dart';
import 'package:mobile_app/features/cars_list/data/models/car_model.dart';
import 'package:mobile_app/features/cars_list/data/models/user_model.dart';
import 'package:mobile_app/features/login/data/models/auth_data_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: HttpConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*
  Example:
  {
    "phone": "89180000000",
    "password": "test123"
  }
  */
  @POST(HttpConstants.signInPostUrl)
  Future<AuthDataModel> login(@Body() Map<String, dynamic> map);

  /*
  Example:
  {
    "name": "test",
    "fam_name": "test_f",
    "email": "test@test.com",
    "patronymic": "test_p",
    "passport_number": "0000 11111111",
    "phone": "89180000000",
    "driver_license": "Fjdk02",
    "password": "test123"
  }
  */
  @POST(HttpConstants.signUpPostUrl)
  Future<AuthDataModel> register(@Body() Map<String, dynamic> map);

  /*
  {
    "phone": "89180000000"
  }
  */
  @GET(HttpConstants.getUser)
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  Future<UserModel> getUser(@Query('phone') String phone);

  @GET(HttpConstants.getCar)
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  Future<CarModel> getCar(@Query('car_id') String carId);
}
