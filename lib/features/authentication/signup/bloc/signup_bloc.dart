import 'dart:async';

import 'package:authentication_with_bloc_firebase_flutter/utils/helpers/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(_signupButtonPressed);
    on<SignupWithGooglePressed>(_signupWithGooglePressed);
    on<SignupWithFacebookPressed>(_signupWithFacebookPressed);
  }

  Future<FutureOr<void>> _signupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      if (event.email.isEmpty) {
        emit(SignupFailure('Email is required'));
        return null;
      }
      if (event.password.isEmpty) {
        emit(SignupFailure('Password is required'));
        return null;
      }
      if (event.confirmPassword.isEmpty) {
        emit(SignupFailure('Confirm password is required'));
        return null;
      }
      if (!event.email.contains('@') ||
          !event.email.contains('.') ||
          event.email.length < 5) {
        emit(SignupFailure('Invalid email'));
        return null;
      }
      if (event.password.length < 6) {
        emit(SignupFailure('Password must be at least 6 characters'));
        return null;
      }
      if (!RegExp(r'\d').hasMatch(event.password)) {
        emit(SignupFailure('Password must contain at least one number'));
        return null;
      }
      if (!RegExp(r'[A-Z]').hasMatch(event.password)) {
        emit(SignupFailure(
            'Password must contain at least one uppercase letter'));
        return null;
      }
      if (!RegExp(r'[a-z]').hasMatch(event.password)) {
        emit(SignupFailure(
            'Password must contain at least one lowercase letter'));
        return null;
      }
      if (event.password != event.confirmPassword) {
        emit(SignupFailure('Password and confirm password must be the same'));
        return null;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(e.message.toString()));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  Future<FutureOr<void>> _signupWithGooglePressed(
      SignupWithGooglePressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      await HelperFunction().signInWithGoogle();
      emit(SignupSuccess());
      if (FirebaseAuth.instance.currentUser == null) {
        emit(SignupFailure('Google signup failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(e.message.toString()));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  Future<FutureOr<void>> _signupWithFacebookPressed(
      SignupWithFacebookPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      await HelperFunction().signInWithFacebook();
      emit(SignupSuccess());
      if (FirebaseAuth.instance.currentUser == null) {
        emit(SignupFailure('Facebook signup failed'));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(e.message.toString()));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
