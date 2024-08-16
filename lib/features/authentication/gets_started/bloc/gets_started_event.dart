part of 'gets_started_bloc.dart';

@immutable
sealed class GetsStartedEvent {}

final class GetsStartedSignupButtonPressed extends GetsStartedEvent{}
final class GetsStartedLoginButtonPressed extends GetsStartedEvent{}
