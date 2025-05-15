import 'package:code_academy_app/common/routes/pages.dart';
import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/application/app_widgets.dart';
import 'package:code_academy_app/screens/application/bloc/app_blocs.dart';
import 'package:code_academy_app/screens/application/bloc/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDashboard extends StatefulWidget {
  const AppDashboard({super.key});

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<AppBlocs>().state.index;
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: buildPage(currentIndex),
          bottomNavigationBar: Container(
            height: 58.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                context.read<AppBlocs>().add(TrigerAppEvents(value));
              },
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              unselectedItemColor: AppColors.primaryFourElementText,
              selectedItemColor: AppColors.primaryElement,

              items: bottomTabs,
            ),
          ),
        ),
      ),
    );
  }
}
