import 'package:code_academy_app/screens/register/bloc/register_events.dart';
import 'package:code_academy_app/screens/register/bloc/register_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<UsernameChangedEvent>(_usernameChangedEvent);
    on<EmailChangedEvent>(_emailChangedEvent);
    on<PasswordChangedEvent>(_passwordChangedEvent);
    on<ConfirmPasswordChangedEvent>(_confirmPasswordChangedEvent);
  }
  void _usernameChangedEvent(
    UsernameChangedEvent event,
    Emitter<RegisterStates> emit,
  ) {
    print(event.username);
    final currentState = state as RegisterInitialState;
    emit(currentState.copyWith(userName: event.username));
  }

  void _emailChangedEvent(
    EmailChangedEvent event,
    Emitter<RegisterStates> emit,
  ) {
    print(event.email);
    final currentState = state as RegisterInitialState;
    emit(currentState.copyWith(email: event.email));
  }

  void _passwordChangedEvent(
    PasswordChangedEvent event,
    Emitter<RegisterStates> emit,
  ) {
    print(event.password);
    final currentState = state as RegisterInitialState;
    emit(currentState.copyWith(password: event.password));
  }

  void _confirmPasswordChangedEvent(
    ConfirmPasswordChangedEvent event,
    Emitter<RegisterStates> emit,
  ) {
    print(event.confirmPassword);
    final currentState = state as RegisterInitialState;
    emit(currentState.copyWith(confirmPassword: event.confirmPassword));
  }
}
