import 'package:mobile_app/features/login/domain/usecases/post_login.dart';
import 'package:mobile_app/features/login/domain/usecases/post_register.dart';
import 'package:mobile_app/utilities/accsess_token.dart';
import 'package:mobile_app/utilities/load_states.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final PostLogin postLogin;
  final PostRegister postRegister;

  _AuthStore(
    this.postLogin,
    this.postRegister,
  );

  @observable
  LoadStates loadState = LoadStates.successful;

  @observable
  bool authTypeIsLogin = true;

  Function()? navigationPush;

  Function()? showWrongLoginOrPassword;

  @action
  Future<void> login(LoginParams loginParams) async {
    final response = await postLogin(loginParams);
    response.fold((l) {
      showWrongLoginOrPassword!();
    }, (r) {
      AccessToken.accessToken = r.accessToken;
      navigationPush!();
    });
  }

  @action
  Future<void> register(RegisterParams registerParams) async {
    loadState = LoadStates.loading;
    final response = await postRegister(registerParams);
    response.fold((l) => loadState = LoadStates.failed,
        (r) => loadState = LoadStates.successful);
  }
}
