import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/debug_feature/src/bloc/bloc.dart';
import 'package:frontend/features/debug_feature/src/data/data.dart';
import 'package:frontend/features/debug_feature/src/widget/widget.dart';

class DebugPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DebugExecutionBloc(
        DebugExecutionSuccess(null),
      ),
      child: _DebugContentPageWidget(),
    );
  }
}

class _DebugContentPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final command = DummyCommand();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 8,
          right: 8,
        ),
        child: Column(
          //TODO: replace with listView
          children: [
            Center(
              child: BlocBuilder<DebugExecutionBloc, DebugExecutionBlocState>(
                cubit: BlocProvider.of<DebugExecutionBloc>(context),
                builder: (context, state) {
                  if (state is DebugExecutionRunning &&
                      state.command.runtimeType == command.runtimeType) {
                    //Loading
                    return ExecutionTriggerWidget<DummyCommand>.loading(
                        command);
                  } else if (state is DebugExecutionSuccess) {
                    if (state.result == null) {
                      //Default
                      return ExecutionTriggerWidget<DummyCommand>(command);
                    } else {
                      return ExecutionTriggerWidget.ready(command, state.result);
                    }
                  } else if (state is DebugExecutionFailure) {
                      return ExecutionTriggerWidget.ready(command, state.result);
                  } else {
                      //Default
                      return ExecutionTriggerWidget<DummyCommand>(command);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
