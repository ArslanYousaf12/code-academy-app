import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: BaseTextWidget(text: "Settings"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
