import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/profile/favorites/widgets/favorites_app_bar.dart';
import 'package:code_academy_app/screens/profile/favorites/widgets/favorites_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FavoritesAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryElement,
              unselectedLabelColor: AppColors.primarySecondaryElementText,
              indicatorColor: AppColors.primaryElement,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              tabs: [Tab(text: 'Courses'), Tab(text: 'Instructors')],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FavoritesList(type: 'courses'),
                  FavoritesList(type: 'instructors'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
