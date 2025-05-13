import 'package:code_academy_app/common/routes/name.dart';
import 'package:code_academy_app/screens/register/bloc/register_bloc.dart';
import 'package:code_academy_app/screens/register/register.dart';
import 'package:code_academy_app/screens/sigin_in/bloc/sigin_in_bloc.dart';
import 'package:code_academy_app/screens/sigin_in/sigin_in_screen.dart';
import 'package:code_academy_app/screens/welcome/bloc/welcome_blocs.dart';
import 'package:code_academy_app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> pages() => [
    PageEntity(
      route: AppRoutes.INITIAL,
      page: const WelcomeScreen(),
      bloc: BlocProvider(create: (_) => WelcomeBlocs()),
    ),
    PageEntity(
      route: AppRoutes.SIGIN_IN,
      page: const SiginInScreen(),
      bloc: BlocProvider(create: (_) => SiginInBloc()),
    ),
    PageEntity(
      route: AppRoutes.REGISTER,
      page: const Register(),
      bloc: BlocProvider(create: (_) => RegisterBloc()),
    ),
    PageEntity(
      route: AppRoutes.APPLICATION,
      page: const SiginInScreen(),
      bloc: BlocProvider(create: (_) => SiginInBloc()),
    ),
  ];
  static List<dynamic> getAllBlocs(BuildContext context) {
    return pages().map((page) => page.bloc).toList();
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    print("Route name: ${settings.name}");
    if (settings.name != null) {
      final page = pages().firstWhere((page) => page.route == settings.name);
      print("Page: ${page.page}");
      return MaterialPageRoute(
        builder: (context) => page.page,
        settings: settings,
        // maintainState: true,
      );
    }
    return MaterialPageRoute(
      builder: (context) => const SiginInScreen(),
      settings: settings,
      // maintainState: true,
    );
  }
}

class PageEntity {
  PageEntity({required this.route, required this.page, this.bloc});

  final String route;
  final Widget page;
  final dynamic bloc;
}
