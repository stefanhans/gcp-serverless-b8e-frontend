import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/debug_feature/src/bloc/bloc.dart';
import 'package:frontend/features/debug_feature/src/data/data.dart';
import 'package:frontend/features/debug_feature/src/debug_feature.dart';

class ExecutionTriggerWidget<SpecificCommand extends Command>
    extends StatelessWidget {
  final SpecificCommand command;
  final bool _loading;
  final DebugResult result;

  ExecutionTriggerWidget(this.command)
      : result = null,
        _loading = false;

  ExecutionTriggerWidget.loading(this.command)
      : result = null,
        _loading = true;

  ExecutionTriggerWidget.ready(this.command, this.result) : _loading = false;

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
          child: ListTile(
        leading: Icon(Icons.update),
        title: Text('running...'),
        onTap: null,
      ));
    } else {
      return Center(
        child: ListTile(
          leading: Icon(Icons.arrow_forward),
          title: result == null ? Text('Run "${command.title}"') : Text('Finished "${command.title}"'),
          subtitle: result == null ? Text('Click here to execute command') : Text('Click to view response'),
          onTap: () {
            if (result != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DebugPageWidget(); //TODO: push correct route and verify back button on top
              }));
            } else {
              BlocProvider.of<DebugExecutionBloc>(context).add(
                DebugRun(command),
              );
            }
          },
        ),
      );
    }
  }
}
