part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLogoutInProgress extends HomeState {}

final class HomeLogoutSuccess extends HomeState {}

final class HomeLogoutFailure extends HomeState {
  final String error;

  HomeLogoutFailure(this.error);
}
