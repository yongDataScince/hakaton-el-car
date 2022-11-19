// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$loadStateAtom =
      Atom(name: '_AuthStore.loadState', context: context);

  @override
  LoadStates get loadState {
    _$loadStateAtom.reportRead();
    return super.loadState;
  }

  @override
  set loadState(LoadStates value) {
    _$loadStateAtom.reportWrite(value, super.loadState, () {
      super.loadState = value;
    });
  }

  late final _$authTypeIsLoginAtom =
      Atom(name: '_AuthStore.authTypeIsLogin', context: context);

  @override
  bool get authTypeIsLogin {
    _$authTypeIsLoginAtom.reportRead();
    return super.authTypeIsLogin;
  }

  @override
  set authTypeIsLogin(bool value) {
    _$authTypeIsLoginAtom.reportWrite(value, super.authTypeIsLogin, () {
      super.authTypeIsLogin = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<void> login(LoginParams loginParams) {
    return _$loginAsyncAction.run(() => super.login(loginParams));
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthStore.register', context: context);

  @override
  Future<void> register(RegisterParams registerParams) {
    return _$registerAsyncAction.run(() => super.register(registerParams));
  }

  @override
  String toString() {
    return '''
loadState: ${loadState},
authTypeIsLogin: ${authTypeIsLogin}
    ''';
  }
}
