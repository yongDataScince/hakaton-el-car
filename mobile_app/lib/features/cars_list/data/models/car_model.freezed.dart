// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'car_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CarModel _$CarModelFromJson(Map<String, dynamic> json) {
  return _CarModel.fromJson(json);
}

/// @nodoc
mixin _$CarModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'car_brand')
  String get carBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_type')
  BodyType get bodyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_power_wt')
  int get enginePowerWt => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_power_hp')
  int get enginePowerHp => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_capacity')
  int get batteryCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_year')
  int get releaseYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_color')
  String get bodyColor => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarModelCopyWith<CarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarModelCopyWith<$Res> {
  factory $CarModelCopyWith(CarModel value, $Res Function(CarModel) then) =
      _$CarModelCopyWithImpl<$Res, CarModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'owner_id') String ownerId,
      String number,
      @JsonKey(name: 'car_brand') String carBrand,
      @JsonKey(name: 'body_type') BodyType bodyType,
      @JsonKey(name: 'engine_power_wt') int enginePowerWt,
      @JsonKey(name: 'engine_power_hp') int enginePowerHp,
      @JsonKey(name: 'battery_capacity') int batteryCapacity,
      @JsonKey(name: 'release_year') int releaseYear,
      @JsonKey(name: 'body_color') String bodyColor,
      int weight,
      List<String> photos});
}

/// @nodoc
class _$CarModelCopyWithImpl<$Res, $Val extends CarModel>
    implements $CarModelCopyWith<$Res> {
  _$CarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? number = null,
    Object? carBrand = null,
    Object? bodyType = null,
    Object? enginePowerWt = null,
    Object? enginePowerHp = null,
    Object? batteryCapacity = null,
    Object? releaseYear = null,
    Object? bodyColor = null,
    Object? weight = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      carBrand: null == carBrand
          ? _value.carBrand
          : carBrand // ignore: cast_nullable_to_non_nullable
              as String,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      enginePowerWt: null == enginePowerWt
          ? _value.enginePowerWt
          : enginePowerWt // ignore: cast_nullable_to_non_nullable
              as int,
      enginePowerHp: null == enginePowerHp
          ? _value.enginePowerHp
          : enginePowerHp // ignore: cast_nullable_to_non_nullable
              as int,
      batteryCapacity: null == batteryCapacity
          ? _value.batteryCapacity
          : batteryCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      releaseYear: null == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      bodyColor: null == bodyColor
          ? _value.bodyColor
          : bodyColor // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarModelCopyWith<$Res> implements $CarModelCopyWith<$Res> {
  factory _$$_CarModelCopyWith(
          _$_CarModel value, $Res Function(_$_CarModel) then) =
      __$$_CarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'owner_id') String ownerId,
      String number,
      @JsonKey(name: 'car_brand') String carBrand,
      @JsonKey(name: 'body_type') BodyType bodyType,
      @JsonKey(name: 'engine_power_wt') int enginePowerWt,
      @JsonKey(name: 'engine_power_hp') int enginePowerHp,
      @JsonKey(name: 'battery_capacity') int batteryCapacity,
      @JsonKey(name: 'release_year') int releaseYear,
      @JsonKey(name: 'body_color') String bodyColor,
      int weight,
      List<String> photos});
}

/// @nodoc
class __$$_CarModelCopyWithImpl<$Res>
    extends _$CarModelCopyWithImpl<$Res, _$_CarModel>
    implements _$$_CarModelCopyWith<$Res> {
  __$$_CarModelCopyWithImpl(
      _$_CarModel _value, $Res Function(_$_CarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? number = null,
    Object? carBrand = null,
    Object? bodyType = null,
    Object? enginePowerWt = null,
    Object? enginePowerHp = null,
    Object? batteryCapacity = null,
    Object? releaseYear = null,
    Object? bodyColor = null,
    Object? weight = null,
    Object? photos = null,
  }) {
    return _then(_$_CarModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      carBrand: null == carBrand
          ? _value.carBrand
          : carBrand // ignore: cast_nullable_to_non_nullable
              as String,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      enginePowerWt: null == enginePowerWt
          ? _value.enginePowerWt
          : enginePowerWt // ignore: cast_nullable_to_non_nullable
              as int,
      enginePowerHp: null == enginePowerHp
          ? _value.enginePowerHp
          : enginePowerHp // ignore: cast_nullable_to_non_nullable
              as int,
      batteryCapacity: null == batteryCapacity
          ? _value.batteryCapacity
          : batteryCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      releaseYear: null == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int,
      bodyColor: null == bodyColor
          ? _value.bodyColor
          : bodyColor // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CarModel with DiagnosticableTreeMixin implements _CarModel {
  const _$_CarModel(
      {required this.id,
      @JsonKey(name: 'owner_id') required this.ownerId,
      required this.number,
      @JsonKey(name: 'car_brand') required this.carBrand,
      @JsonKey(name: 'body_type') required this.bodyType,
      @JsonKey(name: 'engine_power_wt') required this.enginePowerWt,
      @JsonKey(name: 'engine_power_hp') required this.enginePowerHp,
      @JsonKey(name: 'battery_capacity') required this.batteryCapacity,
      @JsonKey(name: 'release_year') required this.releaseYear,
      @JsonKey(name: 'body_color') required this.bodyColor,
      required this.weight,
      required final List<String> photos})
      : _photos = photos;

  factory _$_CarModel.fromJson(Map<String, dynamic> json) =>
      _$$_CarModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  final String number;
  @override
  @JsonKey(name: 'car_brand')
  final String carBrand;
  @override
  @JsonKey(name: 'body_type')
  final BodyType bodyType;
  @override
  @JsonKey(name: 'engine_power_wt')
  final int enginePowerWt;
  @override
  @JsonKey(name: 'engine_power_hp')
  final int enginePowerHp;
  @override
  @JsonKey(name: 'battery_capacity')
  final int batteryCapacity;
  @override
  @JsonKey(name: 'release_year')
  final int releaseYear;
  @override
  @JsonKey(name: 'body_color')
  final String bodyColor;
  @override
  final int weight;
  final List<String> _photos;
  @override
  List<String> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CarModel(id: $id, ownerId: $ownerId, number: $number, carBrand: $carBrand, bodyType: $bodyType, enginePowerWt: $enginePowerWt, enginePowerHp: $enginePowerHp, batteryCapacity: $batteryCapacity, releaseYear: $releaseYear, bodyColor: $bodyColor, weight: $weight, photos: $photos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CarModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ownerId', ownerId))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('carBrand', carBrand))
      ..add(DiagnosticsProperty('bodyType', bodyType))
      ..add(DiagnosticsProperty('enginePowerWt', enginePowerWt))
      ..add(DiagnosticsProperty('enginePowerHp', enginePowerHp))
      ..add(DiagnosticsProperty('batteryCapacity', batteryCapacity))
      ..add(DiagnosticsProperty('releaseYear', releaseYear))
      ..add(DiagnosticsProperty('bodyColor', bodyColor))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('photos', photos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.carBrand, carBrand) ||
                other.carBrand == carBrand) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.enginePowerWt, enginePowerWt) ||
                other.enginePowerWt == enginePowerWt) &&
            (identical(other.enginePowerHp, enginePowerHp) ||
                other.enginePowerHp == enginePowerHp) &&
            (identical(other.batteryCapacity, batteryCapacity) ||
                other.batteryCapacity == batteryCapacity) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.bodyColor, bodyColor) ||
                other.bodyColor == bodyColor) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      number,
      carBrand,
      bodyType,
      enginePowerWt,
      enginePowerHp,
      batteryCapacity,
      releaseYear,
      bodyColor,
      weight,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarModelCopyWith<_$_CarModel> get copyWith =>
      __$$_CarModelCopyWithImpl<_$_CarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarModelToJson(
      this,
    );
  }
}

abstract class _CarModel implements CarModel {
  const factory _CarModel(
      {required final String id,
      @JsonKey(name: 'owner_id') required final String ownerId,
      required final String number,
      @JsonKey(name: 'car_brand') required final String carBrand,
      @JsonKey(name: 'body_type') required final BodyType bodyType,
      @JsonKey(name: 'engine_power_wt') required final int enginePowerWt,
      @JsonKey(name: 'engine_power_hp') required final int enginePowerHp,
      @JsonKey(name: 'battery_capacity') required final int batteryCapacity,
      @JsonKey(name: 'release_year') required final int releaseYear,
      @JsonKey(name: 'body_color') required final String bodyColor,
      required final int weight,
      required final List<String> photos}) = _$_CarModel;

  factory _CarModel.fromJson(Map<String, dynamic> json) = _$_CarModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  String get number;
  @override
  @JsonKey(name: 'car_brand')
  String get carBrand;
  @override
  @JsonKey(name: 'body_type')
  BodyType get bodyType;
  @override
  @JsonKey(name: 'engine_power_wt')
  int get enginePowerWt;
  @override
  @JsonKey(name: 'engine_power_hp')
  int get enginePowerHp;
  @override
  @JsonKey(name: 'battery_capacity')
  int get batteryCapacity;
  @override
  @JsonKey(name: 'release_year')
  int get releaseYear;
  @override
  @JsonKey(name: 'body_color')
  String get bodyColor;
  @override
  int get weight;
  @override
  List<String> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_CarModelCopyWith<_$_CarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
