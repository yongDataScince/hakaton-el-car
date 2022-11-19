import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app/features/cars_list/data/datasources/user_remote_data_source.dart';
import 'package:mobile_app/features/cars_list/data/repositories/user_repository.dart';
import 'package:mobile_app/features/cars_list/domain/repositories/user_repository.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/features/cars_list/presentation/store/user_store.dart';
import 'package:mobile_app/features/login/data/datasources/auth_data_remote_datasource.dart';
import 'package:mobile_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:mobile_app/features/login/domain/repositories/auth_data_repository.dart';
import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/domain/usecases/post_register.dart';
import 'package:mobile_app/features/login/presentation/store/auth_store.dart';
import 'package:mobile_app/services/http/rest_client.dart';

final getIt = GetIt.instance;

void setup() {
  // MobX
  getIt.registerFactory<AuthStore>(() => AuthStore(getIt(), getIt()));
  getIt.registerFactory<UserStore>(() => UserStore(getIt()));

  // Use Cases
  getIt.registerLazySingleton(
    () => PostLogin(getIt()),
  );
  getIt.registerLazySingleton(
    () => PostRegister(getIt()),
  );
  getIt.registerLazySingleton(
    () => GetCars(getIt()),
  );

  // Repositories
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerFactory<CarsRepository>(
    () => CarsRepositoryImpl(getIt()),
  );

  // Data Sources
  getIt.registerLazySingleton<AuthDataRemoteDataSource>(
    () => AuthDataRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<CarsRemoteDataSource>(
    () => CarsRemoteDataSourceImpl(getIt()),
  );

  // getIt.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImp(getIt()),
  // );

  final dio = Dio();
  final client = RestClient(dio);
  getIt.registerLazySingleton(() => client);
  // getIt.registerLazySingleton(() => InternetConnectionChecker());
}
