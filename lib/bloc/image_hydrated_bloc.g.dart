// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_hydrated_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomImageChangeState _$CustomImageChangeStateFromJson(
        Map<String, dynamic> json) =>
    CustomImageChangeState(
      customImage: (json['customImage'] as List<dynamic>)
          .map((e) => CustomImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomImageChangeStateToJson(
        CustomImageChangeState instance) =>
    <String, dynamic>{
      'customImage': instance.customImage,
    };

CustomImageLoadingState _$CustomImageLoadingStateFromJson(
        Map<String, dynamic> json) =>
    CustomImageLoadingState();

Map<String, dynamic> _$CustomImageLoadingStateToJson(
        CustomImageLoadingState instance) =>
    <String, dynamic>{};
