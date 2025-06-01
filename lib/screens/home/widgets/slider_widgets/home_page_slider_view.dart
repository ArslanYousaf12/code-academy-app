import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/home/bloc/home_page_bloc.dart';
import 'package:code_academy_app/screens/home/bloc/home_page_events.dart';
import 'package:code_academy_app/screens/home/bloc/home_page_states.dart';
import 'package:code_academy_app/screens/home/widgets/slider_widgets/slider_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageSliderView extends StatelessWidget {
  const HomePageSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    int sliderIndex = context.watch<HomePageBloc>().state.index;
    return Column(
      children: [
        Container(
          width: 325.w,
          height: 160.h,
          child: PageView(
            onPageChanged: (index) {
              context.read<HomePageBloc>().add(HomePageDots(index));
            },
            children: [
              SliderWidget(),
              SliderWidget(imagePath: "assets/icons/Image(1).png"),
              SliderWidget(imagePath: "assets/icons/Image(2).png"),
            ],
          ),
        ),
        Container(
          child: DotsIndicator(
            dotsCount: 3,
            position: sliderIndex.toDouble(),
            decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
