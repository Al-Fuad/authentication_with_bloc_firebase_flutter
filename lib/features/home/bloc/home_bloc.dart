import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LogoutButtonPressed>(_logoutButtonPressed);
  }

  Future<FutureOr<void>> _logoutButtonPressed(
      LogoutButtonPressed event, Emitter<HomeState> emit) async {
    emit(HomeLogoutInProgress());
    try {
      await FirebaseAuth.instance.signOut();
      emit(HomeLogoutSuccess());
    } catch (e) {
      emit(HomeLogoutFailure(e.toString()));
    }
  }
}
