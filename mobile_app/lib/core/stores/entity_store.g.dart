// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntityStore<T> on _EntityStore<T>, Store {
  late final _$loadStateAtom =
      Atom(name: '_EntityStore.loadState', context: context);

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

  late final _$failureTypeAtom =
      Atom(name: '_EntityStore.failureType', context: context);

  @override
  Failure get failureType {
    _$failureTypeAtom.reportRead();
    return super.failureType;
  }

  @override
  set failureType(Failure value) {
    _$failureTypeAtom.reportWrite(value, super.failureType, () {
      super.failureType = value;
    });
  }

  late final _$entityAtom = Atom(name: '_EntityStore.entity', context: context);

  @override
  T? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(T? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$_EntityStoreActionController =
      ActionController(name: '_EntityStore', context: context);

  @override
  Future<void> loadEntity([LoadParams? params]) {
    final _$actionInfo = _$_EntityStoreActionController.startAction(
        name: '_EntityStore.loadEntity');
    try {
      return super.loadEntity(params);
    } finally {
      _$_EntityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadState: ${loadState},
failureType: ${failureType},
entity: ${entity}
    ''';
  }
}
