// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_car_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarRegisterStore on _CarRegisterStore, Store {
  late final _$loadStateAtom =
      Atom(name: '_CarRegisterStore.loadState', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('_CarRegisterStore.register', context: context);

  @override
  Future<void> register(CarRegParams carRegParams) {
    return _$registerAsyncAction.run(() => super.register(carRegParams));
  }

  @override
  String toString() {
    return '''
loadState: ${loadState}
    ''';
  }
}
