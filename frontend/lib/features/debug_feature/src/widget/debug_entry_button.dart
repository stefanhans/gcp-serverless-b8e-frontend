import 'package:flutter/material.dart';
import 'package:frontend/features/debug_feature/src/view/debug_page_widget.dart';

class DebugEntryButton extends StatelessWidget {
  final Future<String> Function() function;
  final String buttonName;
  DebugEntryButton(this.function, {this.buttonName});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Run ${buttonName ?? 'Debug Command'}"),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DebugPageWidget(function),
          fullscreenDialog: true,
        ),
      ),
    );
  }
}
