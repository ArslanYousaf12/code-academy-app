import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.h,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        image: DecorationImage(
          image: AssetImage(imagePath ?? "assets/icons/Art.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
