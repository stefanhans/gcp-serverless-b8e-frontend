import 'package:equatable/equatable.dart';

class LandingPageState extends Equatable {
  const LandingPageState();
  @override
  List<Object> get props => [];
}

class LandingPageInitial extends LandingPageState {
  final String content;
  LandingPageInitial(this.content)
      : assert(content != null && content.isNotEmpty);
}

class LandingPageLoading extends LandingPageState {}
