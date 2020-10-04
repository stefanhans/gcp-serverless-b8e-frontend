import 'package:equatable/equatable.dart';

class DebugResult extends Equatable {
  final String title;
  final String rawResponse;
  final Object Function(String) mapRawResponse;

  Object get objectResponse => mapRawResponse(rawResponse);

  const DebugResult(
    this.title,
    this.rawResponse, [
    this.mapRawResponse,
  ]);

  @override
  List<Object> get props => [title, rawResponse];
}
