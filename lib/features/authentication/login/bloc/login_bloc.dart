import 'dart:async';

import 'package:authentication_with_bloc_firebase_flutter/utils/helpers/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_loginButtonPressed);
    on<LoginWithGooglePressed>(_loginWithGooglePressed);
    on<LoginWithFacebookPressed>(_loginWithFacebookPressed);
  }

  Future<FutureOr<void>> _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<FutureOr<void>> _loginWithGooglePressed(
      LoginWithGooglePressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await HelperFunction().signInWithGoogle();
      emit(LoginSuccess());
      if (FirebaseAuth.instance.currentUser == null) {
        emit(LoginFailure('Google login failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.runtimeType.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<FutureOr<void>> _loginWithFacebookPressed(
      LoginWithFacebookPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await HelperFunction().signInWithFacebook();
      emit(LoginSuccess());
      if (FirebaseAuth.instance.currentUser == null) {
        emit(LoginFailure('Facebook login failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.runtimeType.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
