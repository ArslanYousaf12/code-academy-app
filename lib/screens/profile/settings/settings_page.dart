import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/profile/settings/widegts/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SettingAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
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
                          TextButton(onPressed: () {}, child: Text("Confirm")),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
