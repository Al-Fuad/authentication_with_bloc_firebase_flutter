part of 'gets_started_bloc.dart';

@immutable
sealed class GetsStartedState {}

final class GetsStartedInitial extends GetsStartedState {}

final class GetsStartedSignupInProgress extends GetsStartedState {}
final class GetsStartedLoginInProgress extends GetsStartedState {}
