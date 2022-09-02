// ignore_for_file: unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables, overridden_fields, annotate_overrides

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:log_paper/models/custom_image.dart';

part 'image_hydrated_bloc.g.dart';

abstract class CustomImageEvent extends Equatable {
  const CustomImageEvent();

  @override
  List<Object> get props => [];
}

class CustomImageAddEvent extends CustomImageEvent {
  final List<CustomImage> customImage;

  const CustomImageAddEvent(this.customImage);

  @override
  List<Object> get props => [customImage];
}

class CustomImageCheckEvent extends CustomImageEvent {
  @override
  List<Object> get props => [];
}

abstract class CustomImageState extends Equatable {
  final List<CustomImage> customImage;

  const CustomImageState({required this.customImage});

  @override
  List<Object> get props => [customImage];
}

@JsonSerializable()
class CustomImageChangeState extends CustomImageState {
  final List<CustomImage> customImage;

  const CustomImageChangeState({required this.customImage})
      : super(customImage: customImage);

  @override
  List<Object> get props => [customImage];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CustomImageChangeState.fromJson(Map<String, dynamic> json) =>
      _$CustomImageChangeStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(CustomImageChangeState state) =>
      _$CustomImageChangeStateToJson(state);
}

@JsonSerializable()
class CustomImageLoadingState extends CustomImageState {
  CustomImageLoadingState() : super(customImage: []);

  @override
  List<Object> get props => [];

  @override

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CustomImageLoadingState.fromJson(Map<String, dynamic> json) =>
      _$CustomImageLoadingStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(CustomImageLoadingState state) =>
      _$CustomImageLoadingStateToJson(state);
}

class CustomImageHydratedBloc
    extends HydratedBloc<CustomImageEvent, CustomImageState> {
  CustomImageHydratedBloc() : super(CustomImageChangeState(customImage: [])) {
    on<CustomImageAddEvent>(_add);
    on<CustomImageCheckEvent>(_check);
  }

  void _add(CustomImageAddEvent event, Emitter<CustomImageState> emit) {
    var term = event.customImage;
    emit(CustomImageLoadingState());
    emit(CustomImageChangeState(customImage: term));
  }

  void _check(CustomImageCheckEvent event, Emitter<CustomImageState> emit) {
    var current = this.state.customImage;
    emit(CustomImageLoadingState());
    emit(CustomImageChangeState(customImage: current));
  }

  @override
  CustomImageState fromJson(Map<String, dynamic> json) =>
      _$CustomImageChangeStateFromJson(json);

  @override
  Map<String, dynamic> toJson(CustomImageState state) {
    if (state is CustomImageLoadingState) {
      return _$CustomImageLoadingStateToJson(state);
    } else {
      return _$CustomImageChangeStateToJson(state as CustomImageChangeState);
    }
  }
}
