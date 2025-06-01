import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SizedBox(
                width: 18.w,
                height: 12.h,
                child: Image.asset("assets/icons/menu.png"),
              ),
            ),
            BaseTextWidget(text: "Profile"),
            GestureDetector(
              onTap: () {
                _showProfileOptions(context);
              },
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset("assets/icons/more-vertical.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryFourElementText.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              _buildOptionItem(context, Icons.edit, 'Edit Profile', () {
                Navigator.pop(context);
                // TODO: Navigate to edit profile screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Edit Profile feature coming soon!')),
                );
              }),
              _buildOptionItem(context, Icons.share, 'Share Profile', () {
                Navigator.pop(context);
                // TODO: Implement share functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Share Profile feature coming soon!')),
                );
              }),
              _buildOptionItem(
                context,
                Icons.privacy_tip_outlined,
                'Privacy Settings',
                () {
                  Navigator.pop(context);
                  // TODO: Navigate to privacy settings
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Privacy Settings feature coming soon!'),
                    ),
                  );
                },
              ),
              _buildOptionItem(
                context,
                Icons.help_outline,
                'Help & Support',
                () {
                  Navigator.pop(context);
                  // TODO: Navigate to help screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Help & Support feature coming soon!'),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryElement, size: 24.w),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
