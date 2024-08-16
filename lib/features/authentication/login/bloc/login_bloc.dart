import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_loginButtonPressed);
  }

  FutureOr<void> _loginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) {
    emit(LoginLoading());
    try {
      //TODO: Implement login logic
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
