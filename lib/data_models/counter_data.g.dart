// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counterdata _$CounterdataFromJson(Map<String, dynamic> json) {
  return Counterdata(
    value: json['value'] as int,
    nested: json['nested'] == null
        ? null
        : Nested.fromJson(json['nested'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CounterdataToJson(Counterdata instance) =>
    <String, dynamic>{
      'value': instance.value,
      'nested': instance.nested,
    };
