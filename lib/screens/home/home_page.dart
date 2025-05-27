import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/home/widgets/home_page_app_bar.dart';
import 'package:code_academy_app/screens/home/widgets/slider_widgets/home_page_slider_view.dart';
import 'package:code_academy_app/screens/home/widgets/home_page_search_box.dart';
import 'package:code_academy_app/screens/home/widgets/home_page_text_widget.dart';
import 'package:code_academy_app/screens/home/widgets/menu_widgets/menu_view_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white

      appBar: HomePageAppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 27.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageTextWidget(
                text: "Hello",
                color: AppColors.primaryThreeElementText,
              ),
              HomePageTextWidget(text: "Arslan", topMargin: 5),
              SizedBox(height: 20.h),
              HomePageSearchBox(),
              SizedBox(height: 20.h),
              HomePageSliderView(),
              MenuViewHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
