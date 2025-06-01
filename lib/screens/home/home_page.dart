import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/home/widgets/course_grid_home_page.dart';
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
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: HomePageTextWidget(
                  text: "Hello",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              SliverToBoxAdapter(
                child: HomePageTextWidget(text: "Arslan", topMargin: 5),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: HomePageSearchBox()),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: HomePageSliderView()),
              SliverToBoxAdapter(child: MenuViewHomePage()),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(childCount: 4, (
                    context,
                    index,
                  ) {
                    return GestureDetector(
                      //TODO: Add functionality to the grid items
                      onTap: () {},
                      child: CourseGridHomePage(),
                    );
                  }),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                    // Adjust the aspect ratio as needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
