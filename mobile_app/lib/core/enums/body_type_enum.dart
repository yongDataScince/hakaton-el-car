import 'package:json_annotation/json_annotation.dart';

enum BodyType {
  @JsonValue('Hatchback')
  hatchback,
  @JsonValue('Sedan')
  sedan,
  @JsonValue('MUVSUV')
  muvsuv,
  @JsonValue('Coupe')
  coupe,
  @JsonValue('Convertible')
  convertible,
  @JsonValue('Jeep')
  jeep,
  @JsonValue('Van')
  van,
}
