import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(_signupButtonPressed);
  }

  FutureOr<void> _signupButtonPressed(SignupButtonPressed event, Emitter<SignupState> emit) {
    emit(SignupLoading());
    try {
      
      emit(SignupSuccess());
    }catch (e) {
      emit(SignupFailure(error: e.toString()));
    }
  }
}
