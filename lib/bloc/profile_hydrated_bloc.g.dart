// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_hydrated_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogProfileChangeState _$LogProfileChangeStateFromJson(
        Map<String, dynamic> json) =>
    LogProfileChangeState(
      profile: (json['profile'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LogProfileChangeStateToJson(
        LogProfileChangeState instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

LogProfileLoadingState _$LogProfileLoadingStateFromJson(
        Map<String, dynamic> json) =>
    LogProfileLoadingState();

Map<String, dynamic> _$LogProfileLoadingStateToJson(
        LogProfileLoadingState instance) =>
    <String, dynamic>{};
