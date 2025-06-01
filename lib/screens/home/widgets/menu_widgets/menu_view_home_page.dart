import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/home/widgets/menu_widgets/reusable_menu_text.dart';
import 'package:code_academy_app/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuViewHomePage extends StatelessWidget {
  const MenuViewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseTextWidget(text: "Choose your course"),
              GestureDetector(
                child: BaseTextWidget(
                  text: "See all",
                  color: AppColors.primaryThreeElementText,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              ReusableMenuText(text: "All"),
              ReusableMenuText(
                text: "Popular",
                textColor: AppColors.primaryThreeElementText,
                backgroundColor: Colors.white,
              ),
              ReusableMenuText(
                text: "Newest",
                textColor: AppColors.primaryThreeElementText,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
