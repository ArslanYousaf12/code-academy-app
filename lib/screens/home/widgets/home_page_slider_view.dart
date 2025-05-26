import 'package:code_academy_app/screens/home/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageSliderView extends StatelessWidget {
  const HomePageSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 325.w,
          height: 160.h,
          child: PageView(
            children: [
              SliderWidget(),
              SliderWidget(imagePath: "assets/icons/Image(1).png"),
              SliderWidget(imagePath: "assets/icons/Image(2).png"),
            ],
          ),
        ),
      ],
    );
  }
}
