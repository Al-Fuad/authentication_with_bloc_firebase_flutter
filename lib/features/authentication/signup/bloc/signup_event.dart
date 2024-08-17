part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupButtonPressed extends SignupEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignupButtonPressed({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

final class SignupWithGooglePressed extends SignupEvent {}
final class SignupWithFacebookPressed extends SignupEvent {}