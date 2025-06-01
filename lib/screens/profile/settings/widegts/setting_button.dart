import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key, required this.removeUserData});

  final void Function() removeUserData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Confirm logout"),
              content: Text("Confrim Logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("cancel"),
                ),
                TextButton(
                  onPressed: () => removeUserData(),
                  child: Text("Confirm"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/Logout.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
