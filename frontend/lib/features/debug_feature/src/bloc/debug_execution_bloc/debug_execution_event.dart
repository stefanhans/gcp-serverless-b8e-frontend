import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:frontend/features/debug_feature/src/debug_feature.dart';
import '../../data/debug_result.dart';

class DebugExecutionBlocEvent extends Equatable {
  const DebugExecutionBlocEvent();
  @override
  List<Object> get props => [];
}

class DebugRun extends DebugExecutionBlocEvent {
  final Command command;
  final bool Function(DebugResult) test;
  DebugRun(
    this.command, {
    this.test,
  });
  @override
  List<Object> get props => [command, test];
}
