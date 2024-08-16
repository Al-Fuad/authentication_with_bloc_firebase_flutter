import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(_signupButtonPressed);
  }

  Future<FutureOr<void>> _signupButtonPressed(SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(error: e.toString()));
    }
  }
}
