import 'package:code_academy_app/screens/sigin_in/bloc/sigin_in_events.dart';
import 'package:code_academy_app/screens/sigin_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginInBloc extends Bloc<SiginInEvents, SignInState> {
  SiginInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      // debugPrint("Email: ${event.email}");
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      // debugPrint("Password: ${event.password}");
      emit(state.copyWith(password: event.password));
    });
  }
}
