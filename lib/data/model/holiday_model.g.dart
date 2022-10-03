// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) => HolidayModel(
      date: json['date'] as String?,
      localName: json['localName'] as String?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      fixed: json['fixed'] as bool?,
      global: json['global'] as bool?,
      counties: json['counties'] as String?,
      launchYear: json['launchYear'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$HolidayModelToJson(HolidayModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'localName': instance.localName,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'fixed': instance.fixed,
      'global': instance.global,
      'counties': instance.counties,
      'launchYear': instance.launchYear,
      'type': instance.type,
    };
