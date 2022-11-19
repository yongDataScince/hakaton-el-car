// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'self_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelfDataModel _$SelfDataModelFromJson(Map<String, dynamic> json) {
  return _SelfDataModel.fromJson(json);
}

/// @nodoc
mixin _$SelfDataModel {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'family_name')
  String get familyName => throw _privateConstructorUsedError;
  String get patronymic => throw _privateConstructorUsedError;
  @JsonKey(name: 'passport_number')
  String get passportNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_license')
  String get driverLicense => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelfDataModelCopyWith<SelfDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfDataModelCopyWith<$Res> {
  factory $SelfDataModelCopyWith(
          SelfDataModel value, $Res Function(SelfDataModel) then) =
      _$SelfDataModelCopyWithImpl<$Res, SelfDataModel>;
  @useResult
  $Res call(
      {String email,
      String name,
      @JsonKey(name: 'family_name') String familyName,
      String patronymic,
      @JsonKey(name: 'passport_number') String passportNumber,
      @JsonKey(name: 'driver_license') String driverLicense,
      String password});
}

/// @nodoc
class _$SelfDataModelCopyWithImpl<$Res, $Val extends SelfDataModel>
    implements $SelfDataModelCopyWith<$Res> {
  _$SelfDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? familyName = null,
    Object? patronymic = null,
    Object? passportNumber = null,
    Object? driverLicense = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
      driverLicense: null == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelfDataModelCopyWith<$Res>
    implements $SelfDataModelCopyWith<$Res> {
  factory _$$_SelfDataModelCopyWith(
          _$_SelfDataModel value, $Res Function(_$_SelfDataModel) then) =
      __$$_SelfDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      @JsonKey(name: 'family_name') String familyName,
      String patronymic,
      @JsonKey(name: 'passport_number') String passportNumber,
      @JsonKey(name: 'driver_license') String driverLicense,
      String password});
}

/// @nodoc
class __$$_SelfDataModelCopyWithImpl<$Res>
    extends _$SelfDataModelCopyWithImpl<$Res, _$_SelfDataModel>
    implements _$$_SelfDataModelCopyWith<$Res> {
  __$$_SelfDataModelCopyWithImpl(
      _$_SelfDataModel _value, $Res Function(_$_SelfDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? familyName = null,
    Object? patronymic = null,
    Object? passportNumber = null,
    Object? driverLicense = null,
    Object? password = null,
  }) {
    return _then(_$_SelfDataModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: null == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      passportNumber: null == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String,
      driverLicense: null == driverLicense
          ? _value.driverLicense
          : driverLicense // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelfDataModel with DiagnosticableTreeMixin implements _SelfDataModel {
  const _$_SelfDataModel(
      {required this.email,
      required this.name,
      @JsonKey(name: 'family_name') required this.familyName,
      required this.patronymic,
      @JsonKey(name: 'passport_number') required this.passportNumber,
      @JsonKey(name: 'driver_license') required this.driverLicense,
      required this.password});

  factory _$_SelfDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_SelfDataModelFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  @JsonKey(name: 'family_name')
  final String familyName;
  @override
  final String patronymic;
  @override
  @JsonKey(name: 'passport_number')
  final String passportNumber;
  @override
  @JsonKey(name: 'driver_license')
  final String driverLicense;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelfDataModel(email: $email, name: $name, familyName: $familyName, patronymic: $patronymic, passportNumber: $passportNumber, driverLicense: $driverLicense, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelfDataModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('familyName', familyName))
      ..add(DiagnosticsProperty('patronymic', patronymic))
      ..add(DiagnosticsProperty('passportNumber', passportNumber))
      ..add(DiagnosticsProperty('driverLicense', driverLicense))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelfDataModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.driverLicense, driverLicense) ||
                other.driverLicense == driverLicense) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, familyName,
      patronymic, passportNumber, driverLicense, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelfDataModelCopyWith<_$_SelfDataModel> get copyWith =>
      __$$_SelfDataModelCopyWithImpl<_$_SelfDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelfDataModelToJson(
      this,
    );
  }
}

abstract class _SelfDataModel implements SelfDataModel {
  const factory _SelfDataModel(
      {required final String email,
      required final String name,
      @JsonKey(name: 'family_name') required final String familyName,
      required final String patronymic,
      @JsonKey(name: 'passport_number') required final String passportNumber,
      @JsonKey(name: 'driver_license') required final String driverLicense,
      required final String password}) = _$_SelfDataModel;

  factory _SelfDataModel.fromJson(Map<String, dynamic> json) =
      _$_SelfDataModel.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  @JsonKey(name: 'family_name')
  String get familyName;
  @override
  String get patronymic;
  @override
  @JsonKey(name: 'passport_number')
  String get passportNumber;
  @override
  @JsonKey(name: 'driver_license')
  String get driverLicense;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SelfDataModelCopyWith<_$_SelfDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
