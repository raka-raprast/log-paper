// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dnd_hydrated_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DndChangeState _$DndChangeStateFromJson(Map<String, dynamic> json) =>
    DndChangeState(
      dnd: (json['dnd'] as List<dynamic>)
          .map((e) => Dnd.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DndChangeStateToJson(DndChangeState instance) =>
    <String, dynamic>{
      'dnd': instance.dnd,
    };

DndLoadingState _$DndLoadingStateFromJson(Map<String, dynamic> json) =>
    DndLoadingState();

Map<String, dynamic> _$DndLoadingStateToJson(DndLoadingState instance) =>
    <String, dynamic>{};
