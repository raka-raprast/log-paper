// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dnd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dnd _$DndFromJson(Map<String, dynamic> json) => Dnd(
    title: json['dndtitle'] as String,
    oilBearingTemp: json['dndoilBearingTemp'] as int,
    pressureDisch: json['dndpressureDisch'] as int,
    flowRate: json['dndflowRate'] as int,
    rpm: json['dndrpm'] as int,
    coolTemp: json['dndcoolTemp'] as int,
    oilTempPressure: json['dndoilTempPressure'] as String,
    batteryVolt: json['dndbatteryVolt'] as int,
    fuelRate: json['dndfuelRate'] as int);

Map<String, dynamic> _$DndToJson(Dnd instance) => <String, dynamic>{
      'dndtitle': instance.title,
      'dndoilBearingTemp': instance.oilBearingTemp,
      'dndpressureDisch': instance.pressureDisch,
      'dndflowRate': instance.flowRate,
      'dndrpm': instance.rpm,
      'dndcoolTemp': instance.coolTemp,
      'dndoilTempPressure': instance.oilTempPressure,
      'dndfuelRate': instance.fuelRate,
    };
