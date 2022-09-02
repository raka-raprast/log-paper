// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_hydrated_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OngoingChangeState _$OngoingChangeStateFromJson(Map<String, dynamic> json) =>
    OngoingChangeState(
      ongoing: (json['ongoing'] as List<dynamic>)
          .map((e) => Ongoing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OngoingChangeStateToJson(OngoingChangeState instance) =>
    <String, dynamic>{
      'ongoing': instance.ongoing,
    };

OngoingLoadingState _$OngoingLoadingStateFromJson(Map<String, dynamic> json) =>
    OngoingLoadingState();

Map<String, dynamic> _$OngoingLoadingStateToJson(
        OngoingLoadingState instance) =>
    <String, dynamic>{};
