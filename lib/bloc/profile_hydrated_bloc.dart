// ignore_for_file: unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables, overridden_fields, annotate_overrides

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:log_paper/models/profile.dart';

part 'profile_hydrated_bloc.g.dart';

abstract class LogProfileEvent extends Equatable {
  const LogProfileEvent();

  @override
  List<Object> get props => [];
}

class LogProfileAddEvent extends LogProfileEvent {
  final Profile profile;

  const LogProfileAddEvent(this.profile);

  @override
  List<Object> get props => [profile];
}

class LogProfileCheckEvent extends LogProfileEvent {
  @override
  List<Object> get props => [];
}

class LogProfileRemoveEvent extends LogProfileEvent {
  final Profile profile;

  const LogProfileRemoveEvent(this.profile);

  @override
  List<Object> get props => [profile];
}

abstract class LogProfileState extends Equatable {
  final List<Profile> profile;

  const LogProfileState({required this.profile});

  @override
  List<Object> get props => [profile];
}

@JsonSerializable()
class LogProfileChangeState extends LogProfileState {
  final List<Profile> profile;

  const LogProfileChangeState({required this.profile})
      : super(profile: profile);

  @override
  List<Object> get props => [profile];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory LogProfileChangeState.fromJson(Map<String, dynamic> json) =>
      _$LogProfileChangeStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(LogProfileChangeState state) =>
      _$LogProfileChangeStateToJson(state);
}

@JsonSerializable()
class LogProfileLoadingState extends LogProfileState {
  LogProfileLoadingState() : super(profile: []);

  @override
  List<Object> get props => [];

  @override

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory LogProfileLoadingState.fromJson(Map<String, dynamic> json) =>
      _$LogProfileLoadingStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(LogProfileLoadingState state) =>
      _$LogProfileLoadingStateToJson(state);
}

class LogProfileHydratedBloc
    extends HydratedBloc<LogProfileEvent, LogProfileState> {
  LogProfileHydratedBloc() : super(LogProfileChangeState(profile: [])) {
    on<LogProfileAddEvent>(_add);
    on<LogProfileRemoveEvent>(_remove);
    on<LogProfileCheckEvent>(_check);
  }

  void _add(LogProfileAddEvent event, Emitter<LogProfileState> emit) {
    var term = event.profile;

    emit(LogProfileLoadingState());
    emit(LogProfileChangeState(profile: [term]));
  }

  void _remove(LogProfileRemoveEvent event, Emitter<LogProfileState> emit) {
    emit(LogProfileLoadingState());
    emit(LogProfileChangeState(profile: []));
  }

  void _check(LogProfileCheckEvent event, Emitter<LogProfileState> emit) {
    var current = this.state.profile;
    emit(LogProfileLoadingState());
    emit(LogProfileChangeState(profile: current));
  }

  @override
  LogProfileState fromJson(Map<String, dynamic> json) =>
      _$LogProfileChangeStateFromJson(json);

  @override
  Map<String, dynamic> toJson(LogProfileState state) {
    if (state is LogProfileLoadingState) {
      return _$LogProfileLoadingStateToJson(state);
    } else {
      return _$LogProfileChangeStateToJson(state as LogProfileChangeState);
    }
  }
}
