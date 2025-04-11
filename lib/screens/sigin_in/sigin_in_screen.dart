import 'package:code_academy_app/screens/sigin_in/widgets/sigin_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiginInScreen extends StatefulWidget {
  const SiginInScreen({super.key});

  @override
  State<SiginInScreen> createState() => _SiginInScreenState();
}

class _SiginInScreenState extends State<SiginInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                  child: reusableText("Or use your email account to login"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        "Enter your email address",
                        "email",
                        "user",
                      ),
                      reusableText("Password"),
                      SizedBox(height: 5.h),
                      buildTextField("Enter your Password", "password", "lock"),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLoginAndRegButton("Login", "login"),
                buildLoginAndRegButton("Register", "register"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
