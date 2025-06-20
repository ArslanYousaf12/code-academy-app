import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryText,
          size: 20.w,
        ),
      ),
      title: Text(
        'Payment Details',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Add payment method feature coming soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: Icon(Icons.add, color: AppColors.primaryElement, size: 24.w),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
