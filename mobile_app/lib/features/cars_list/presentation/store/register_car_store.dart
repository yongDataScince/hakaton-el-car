import 'package:mobile_app/features/cars_list/domain/usecases/register_car.dart';
import 'package:mobile_app/utilities/load_states.dart';
import 'package:mobx/mobx.dart';

part 'register_car_store.g.dart';

class CarRegisterStore = _CarRegisterStore with _$CarRegisterStore;

abstract class _CarRegisterStore with Store {
  final RegisterCar registerCar;

  _CarRegisterStore(
    this.registerCar,
  );

  @observable
  LoadStates loadState = LoadStates.successful;

  Function()? navigationPop;

  Function()? showWrongCarRegister;

  @action
  Future<void> register(CarRegParams carRegParams) async {
    // loadState = LoadStates.loading;
    final response = await registerCar(carRegParams);
    response.fold((l) {
      showWrongCarRegister!();
    }, (r) => navigationPop!());
  }
}
