import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/debug_feature/src/data/data.dart';

import 'bloc.dart';

class DebugExecutionBloc
    extends Bloc<DebugExecutionBlocEvent, DebugExecutionBlocState> {
  DebugExecutionBloc(DebugExecutionBlocState initialState)
      : super(initialState);

  Command _currentCommand;

  @override
  Stream<DebugExecutionBlocState> mapEventToState(
      DebugExecutionBlocEvent event) async* {
    if (event is DebugRun && state is! DebugExecutionRunning) {
      _currentCommand = event.command;
      yield DebugExecutionRunning(_currentCommand);
      final result = await event?.command?.command();
      if (event?.test?.call(result) ?? true) {
        yield DebugExecutionSuccess(result);
      } else {
        yield DebugExecutionFailure(result);
      }
    }
  }
}
