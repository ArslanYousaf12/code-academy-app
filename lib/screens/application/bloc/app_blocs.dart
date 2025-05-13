import 'package:code_academy_app/screens/application/bloc/app_events.dart';
import 'package:code_academy_app/screens/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TrigerAppEvents>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}
