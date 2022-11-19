import 'package:mobile_app/core/stores/load_params.dart';
import 'package:mobile_app/features/cars_list/domain/entities/car_entity.dart';
import 'package:mobile_app/features/cars_list/domain/usecases/get_user.dart';
import 'package:mobile_app/core/stores/entity_store.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore extends EntityStore<List<CarEntity>> with Store {
  final GetUser getCars;

  _UserStore(
    this.getCars,
  );

  @override
  fetchEntity([LoadParams? params]) {
    return getCars(params!.params!['userParams'] as UserParams);
  }

  Future<void> getCarsFromUser(UserParams userParams) async {
    await loadEntity(LoadParams({'userParams': userParams}));
  }
}
