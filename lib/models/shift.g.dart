// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftTime: json['shiftTime'] as String,
      status: json['status'] as String,
      oilBearingTemp: json['oilBearingTemp'] as int,
      pressureDisch: json['pressureDisch'] as int,
      flowRate: json['flowRate'] as int,
      rpm: json['rpm'] as int,
      coolTemp: json['coolTemp'] as int,
      oilTempPressure: json['oilTempPressure'] as int,
      batteryVolt: json['batteryVolt'] as int,
      fuelRate: json['fuelRate'] as int,
      remarkKeterangan: json['remarkKeterangan'] as String,
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftTime': instance.shiftTime,
      'status': instance.status,
      'oilBearingTemp': instance.oilBearingTemp,
      'pressureDisch': instance.pressureDisch,
      'flowRate': instance.flowRate,
      'rpm': instance.rpm,
      'coolTemp': instance.coolTemp,
      'oilTempPressure': instance.oilTempPressure,
      'batteryVolt': instance.batteryVolt,
      'fuelRate': instance.fuelRate,
      'remarkKeterangan': instance.remarkKeterangan,
    };
