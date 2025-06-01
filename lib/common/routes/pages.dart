import 'package:code_academy_app/common/routes/name.dart';
import 'package:code_academy_app/common/values/constants.dart';
import 'package:code_academy_app/global.dart';
import 'package:code_academy_app/screens/application/app_dashboard.dart';
import 'package:code_academy_app/screens/application/bloc/app_blocs.dart';
import 'package:code_academy_app/screens/home/bloc/home_page_bloc.dart';
import 'package:code_academy_app/screens/home/home_page.dart';
import 'package:code_academy_app/screens/profile/settings/bloc/setting_bloc.dart';
import 'package:code_academy_app/screens/profile/settings/settings_page.dart';
import 'package:code_academy_app/screens/profile/payment_details/payment_details_page.dart';
import 'package:code_academy_app/screens/profile/achievement/achievement_page.dart';
import 'package:code_academy_app/screens/profile/favorites/favorites_page.dart';
import 'package:code_academy_app/screens/profile/reminders/reminders_page.dart';
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
      page: const AppDashboard(),
      bloc: BlocProvider(create: (_) => AppBlocs()),
    ),
    PageEntity(
      route: AppRoutes.Home_PAGE,
      page: const HomePage(),
      bloc: BlocProvider(create: (_) => HomePageBloc()),
    ),
    PageEntity(
      route: AppRoutes.PROFILE_SETTINGS,
      page: const SettingsPage(),
      bloc: BlocProvider(create: (_) => SettingBloc()),
    ),
    PageEntity(
      route: AppRoutes.PAYMENT_DETAILS,
      page: const PaymentDetailsPage(),
    ),
    PageEntity(
      route: AppRoutes.ACHIEVEMENT,
      page: const AchievementPage(),
    ),
    PageEntity(
      route: AppRoutes.FAVORITES,
      page: const FavoritesPage(),
    ),
    PageEntity(
      route: AppRoutes.REMINDERS,
      page: const RemindersPage(),
    ),
  ];
  static List<BlocProvider> getAllBlocs(BuildContext context) {
    return pages()
        .map((page) => page.bloc)
        .where((bloc) => bloc != null)
        .cast<BlocProvider>()
        .toList();
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    print("Route name: ${settings.name}");
    if (settings.name != null) {
      final page = pages().firstWhere((page) => page.route == settings.name);
      print("Page: ${page.page}");
      bool? isUserFirstTime = Global.storageService.getbool(
        AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME,
      );
      bool isLogedin = Global.storageService.isLogedIn();
      
      // Only redirect to AppDashboard for the initial route when logged in
      if (isLogedin == true && settings.name == AppRoutes.INITIAL) {
        return MaterialPageRoute(
          builder: (context) => const AppDashboard(),
          settings: settings,
        );
      }
      
      if (page.route == AppRoutes.INITIAL && isUserFirstTime == true) {
        return MaterialPageRoute(
          builder: (context) => const SiginInScreen(),
          settings: settings,
        );
      }
      if (page.route == AppRoutes.SIGIN_IN && isUserFirstTime == false) {
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
          settings: settings,
        );
      }
      return MaterialPageRoute(
        builder: (context) => page.page,
        settings: settings,
      );
    }
    return MaterialPageRoute(
      builder: (context) => const SiginInScreen(),
      settings: settings,
    );
  }
}

class PageEntity {
  PageEntity({required this.route, required this.page, this.bloc});

  final String route;
  final Widget page;
  final dynamic bloc;
}
