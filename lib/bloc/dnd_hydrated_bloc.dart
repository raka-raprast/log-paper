// ignore_for_file: unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables, overridden_fields, annotate_overrides

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:log_paper/models/dnd.dart';

part 'dnd_hydrated_bloc.g.dart';

abstract class DndEvent extends Equatable {
  const DndEvent();

  @override
  List<Object> get props => [];
}

class DndAddEvent extends DndEvent {
  final List<Dnd> dnd;

  const DndAddEvent(this.dnd);

  @override
  List<Object> get props => [dnd];
}

class DndCheckEvent extends DndEvent {
  @override
  List<Object> get props => [];
}

abstract class DndState extends Equatable {
  final List<Dnd> dnd;

  const DndState({required this.dnd});

  @override
  List<Object> get props => [dnd];
}

@JsonSerializable()
class DndChangeState extends DndState {
  final List<Dnd> dnd;

  const DndChangeState({required this.dnd}) : super(dnd: dnd);

  @override
  List<Object> get props => [dnd];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DndChangeState.fromJson(Map<String, dynamic> json) =>
      _$DndChangeStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(DndChangeState state) =>
      _$DndChangeStateToJson(state);
}

@JsonSerializable()
class DndLoadingState extends DndState {
  DndLoadingState() : super(dnd: []);

  @override
  List<Object> get props => [];

  @override

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DndLoadingState.fromJson(Map<String, dynamic> json) =>
      _$DndLoadingStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson(DndLoadingState state) =>
      _$DndLoadingStateToJson(state);
}

class DndHydratedBloc extends HydratedBloc<DndEvent, DndState> {
  DndHydratedBloc() : super(DndChangeState(dnd: [])) {
    on<DndAddEvent>(_add);
    on<DndCheckEvent>(_check);
  }

  void _add(DndAddEvent event, Emitter<DndState> emit) {
    var term = event.dnd;
    emit(DndLoadingState());
    emit(DndChangeState(dnd: term));
  }

  void _check(DndCheckEvent event, Emitter<DndState> emit) {
    var current = this.state.dnd;
    log(current.length.toString());
    emit(DndLoadingState());
    emit(DndChangeState(dnd: current));
  }

  @override
  DndState fromJson(Map<String, dynamic> json) =>
      _$DndChangeStateFromJson(json);

  @override
  Map<String, dynamic> toJson(DndState state) {
    if (state is DndLoadingState) {
      return _$DndLoadingStateToJson(state);
    } else {
      return _$DndChangeStateToJson(state as DndChangeState);
    }
  }
}
