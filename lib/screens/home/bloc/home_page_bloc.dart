import 'package:code_academy_app/screens/home/bloc/home_page_events.dart';
import 'package:code_academy_app/screens/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(HomePageStates()) {
    on<HomePageDots>(_homePageEventHandler);
  }
  void _homePageEventHandler(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.currentIndex));
  }
}
