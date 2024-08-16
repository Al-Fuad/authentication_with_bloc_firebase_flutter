part of 'gets_started_bloc.dart';

@immutable
sealed class GetsStartedState {}

final class GetsStartedInitial extends GetsStartedState {}

final class GetsStartedSignupButtonPressedState extends GetsStartedState {}
final class GetsStartedLoginButtonPressedState extends GetsStartedState {}
