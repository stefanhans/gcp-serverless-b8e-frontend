import 'package:equatable/equatable.dart';

import 'debug_result.dart';

class Command extends Equatable {
  final String title;
  final Future<DebugResult> Function() command;

  const Command(this.title, this.command);

  @override
  List<Object> get props => [title, command];
}

class DummyCommand extends Command {
  DummyCommand()
      : super(
          'Dummy Title of Command',
          () async {
            await Future.delayed(const Duration(seconds: 3));
            return DebugResult(
              'Dummy title of response',
              'Dummy Raw Content',
            );
          },
        );
}
