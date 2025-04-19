import 'package:code_academy_app/app_blocs.dart';
import 'package:code_academy_app/screens/sigin_in/bloc/sigin_in_bloc.dart';
import 'package:code_academy_app/screens/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get providers => [
    BlocProvider(create: (context) => WelcomeBlocs()),
    BlocProvider(lazy: false, create: (context) => AppBlocs()),
    BlocProvider(create: (context) => SiginInBloc()),
  ];
}
