// ignore_for_file: unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables, overridden_fields, annotate_overrides

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:log_paper/models/ongoing.dart';

part 'ongoing_hydrated_bloc.g.dart';

abstract class OngoingEvent extends Equatable {
  const OngoingEvent();

  @override
  List<Object> get props => [];
}

class OngoingAddEvent extends OngoingEvent {
  final Ongoing ongoing;

  const OngoingAddEvent(this.ongoing);

  @override
  List<Object> get props => [ongoing];
}

class OngoingCheckEvent extends OngoingEvent {
  @override
  List<Object> get props => [];
}

class OngoingRemoveEvent extends OngoingEvent {
  const OngoingRemoveEvent();

  @override
  List<Object> get props => [];
}

abstract class OngoingState extends Equatable {
  final List<Ongoing> ongoing;

  const OngoingState({required this.ongoing});

  @override
  List<Object> get props => [ongoing];
}

@JsonSerializable()
class OngoingChangeState extends OngoingState {
  final List<Ongoing> ongoing;

  const OngoingChangeState({required this.ongoing}) : super(ongoing: ongoing);

  @override
  List<Object> get props => [ongoing];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory OngoingChangeState.fromJson(Map<String, dynamic> json) =>
      _$OngoingChangeStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(OngoingChangeState state) =>
      _$OngoingChangeStateToJson(state);
}

@JsonSerializable()
class OngoingLoadingState extends OngoingState {
  OngoingLoadingState() : super(ongoing: []);

  @override
  List<Object> get props => [];

  @override

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory OngoingLoadingState.fromJson(Map<String, dynamic> json) =>
      _$OngoingLoadingStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(OngoingLoadingState state) =>
      _$OngoingLoadingStateToJson(state);
}

class OngoingHydratedBloc extends HydratedBloc<OngoingEvent, OngoingState> {
  OngoingHydratedBloc() : super(OngoingChangeState(ongoing: [])) {
    on<OngoingAddEvent>(_add);
    on<OngoingRemoveEvent>(_remove);
    on<OngoingCheckEvent>(_check);
  }

  void _add(OngoingAddEvent event, Emitter<OngoingState> emit) {
    var term = event.ongoing;

    emit(OngoingLoadingState());
    emit(OngoingChangeState(ongoing: [term]));
  }

  void _remove(OngoingRemoveEvent event, Emitter<OngoingState> emit) {
    emit(OngoingLoadingState());
    emit(OngoingChangeState(ongoing: []));
  }

  void _check(OngoingCheckEvent event, Emitter<OngoingState> emit) {
    var current = this.state.ongoing;
    emit(OngoingLoadingState());
    emit(OngoingChangeState(ongoing: current));
  }

  @override
  OngoingState fromJson(Map<String, dynamic> json) =>
      _$OngoingChangeStateFromJson(json);

  @override
  Map<String, dynamic> toJson(OngoingState state) {
    if (state is OngoingLoadingState) {
      return _$OngoingLoadingStateToJson(state);
    } else {
      return _$OngoingChangeStateToJson(state as OngoingChangeState);
    }
  }
}
