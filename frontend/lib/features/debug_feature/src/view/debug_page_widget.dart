import 'package:flutter/material.dart';

class DebugPageWidget extends StatelessWidget {
  final Future<String> Function() debugFunction;

  DebugPageWidget(this.debugFunction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Debug Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: _TextCard(debugFunction),
      ),
    );
  }
}

class _TextCard extends StatefulWidget {
  final Future<String> Function() debugFunction;

  _TextCard(this.debugFunction);

  @override
  State<StatefulWidget> createState() => _PendingTextCard(debugFunction);
}

class _PendingTextCard extends State<_TextCard> {
  final Future<String> Function() requestFunction;
  String cardText;

  _PendingTextCard(this.requestFunction);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(cardText ?? "Request Pending"),
        ),
      ),
      Spacer(),
      Center(
        child: Column(
          children: [
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.arrow_right_alt_outlined),
              onPressed: () async {
                final result = await requestFunction?.call();
                setState(() {
                  cardText = result;
                });
              },
            ),
            Text("Run"),
            SizedBox(height: 10),
          ],
        ),
      ),
    ]);
  }
}
