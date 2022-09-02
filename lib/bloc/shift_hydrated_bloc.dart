// ignore_for_file: unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables, overridden_fields, annotate_overrides

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:log_paper/models/shift.dart';

part 'shift_hydrated_bloc.g.dart';

abstract class ShiftEvent extends Equatable {
  const ShiftEvent();

  @override
  List<Object> get props => [];
}

class ShiftAddEvent extends ShiftEvent {
  final List<Shift> shift;

  const ShiftAddEvent(this.shift);

  @override
  List<Object> get props => [shift];
}

class ShiftCheckEvent extends ShiftEvent {
  @override
  List<Object> get props => [];
}

abstract class ShiftState extends Equatable {
  final List<Shift> shift;

  const ShiftState({required this.shift});

  @override
  List<Object> get props => [shift];
}

@JsonSerializable()
class ShiftChangeState extends ShiftState {
  final List<Shift> shift;

  const ShiftChangeState({required this.shift}) : super(shift: shift);

  @override
  List<Object> get props => [shift];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ShiftChangeState.fromJson(Map<String, dynamic> json) =>
      _$ShiftChangeStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(ShiftChangeState state) =>
      _$ShiftChangeStateToJson(state);
}

@JsonSerializable()
class ShiftLoadingState extends ShiftState {
  ShiftLoadingState() : super(shift: []);

  @override
  List<Object> get props => [];

  @override

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ShiftLoadingState.fromJson(Map<String, dynamic> json) =>
      _$ShiftLoadingStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(ShiftLoadingState state) =>
      _$ShiftLoadingStateToJson(state);
}

class ShiftHydratedBloc extends HydratedBloc<ShiftEvent, ShiftState> {
  ShiftHydratedBloc() : super(ShiftChangeState(shift: [])) {
    on<ShiftAddEvent>(_add);
    on<ShiftCheckEvent>(_check);
  }

  void _add(ShiftAddEvent event, Emitter<ShiftState> emit) {
    var term = event.shift;
    emit(ShiftLoadingState());
    emit(ShiftChangeState(shift: term));
  }

  void _check(ShiftCheckEvent event, Emitter<ShiftState> emit) {
    var current = this.state.shift;
    emit(ShiftLoadingState());
    emit(ShiftChangeState(shift: current));
  }

  @override
  ShiftState fromJson(Map<String, dynamic> json) =>
      _$ShiftChangeStateFromJson(json);

  @override
  Map<String, dynamic> toJson(ShiftState state) {
    if (state is ShiftLoadingState) {
      return _$ShiftLoadingStateToJson(state);
    } else {
      return _$ShiftChangeStateToJson(state as ShiftChangeState);
    }
  }
}
