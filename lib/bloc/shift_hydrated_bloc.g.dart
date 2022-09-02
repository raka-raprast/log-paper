// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_hydrated_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftChangeState _$ShiftChangeStateFromJson(Map<String, dynamic> json) =>
    ShiftChangeState(
      shift: (json['shift'] as List<dynamic>)
          .map((e) => Shift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShiftChangeStateToJson(ShiftChangeState instance) =>
    <String, dynamic>{
      'shift': instance.shift,
    };

ShiftLoadingState _$ShiftLoadingStateFromJson(Map<String, dynamic> json) =>
    ShiftLoadingState();

Map<String, dynamic> _$ShiftLoadingStateToJson(ShiftLoadingState instance) =>
    <String, dynamic>{};
