import 'package:equatable/equatable.dart';
import 'package:frontend/features/debug_feature/src/debug_feature.dart';

class DebugExecutionBlocState extends Equatable {
  const DebugExecutionBlocState();
  @override
  List<Object> get props => [];
}

class DebugExecutionRunning extends DebugExecutionBlocState {
  final Command command;

  DebugExecutionRunning(this.command);

  @override
  List<Object> get props => [command];
}

class DebugExecutionSuccess extends DebugExecutionBlocState {
  final DebugResult result;
  const DebugExecutionSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class DebugExecutionFailure extends DebugExecutionBlocState {
  final DebugResult result;
  const DebugExecutionFailure(this.result);
  @override
  List<Object> get props => [result];
}
