import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'gets_started_event.dart';
part 'gets_started_state.dart';

class GetsStartedBloc extends Bloc<GetsStartedEvent, GetsStartedState> {
  GetsStartedBloc() : super(GetsStartedInitial()) {
    on<GetsStartedSignupButtonPressed>((event, emit) {
      emit(GetsStartedSignupButtonPressedState());
    });
    on<GetsStartedLoginButtonPressed>((event, emit) {
      emit(GetsStartedLoginButtonPressedState());
    });
  }
}
