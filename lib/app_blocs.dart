import 'package:code_academy_app/app_events.dart';
import 'package:code_academy_app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitalState()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
    });
  }
}
