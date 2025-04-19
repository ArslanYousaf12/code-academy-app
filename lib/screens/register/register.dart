import 'package:code_academy_app/screens/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                Center(
                  child: reusableText("Or use your email account to login"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
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
                        (value) {
                          // context.read<SiginInBloc>().add(
                          //   EmailEvent(value),
                          // );
                        },
                      ),
                      reusableText("Password"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        "Enter your Password",
                        "password",
                        "lock",
                        (value) {
                          // context.read<SiginInBloc>().add(
                          //   PasswordEvent(value),
                          // );
                        },
                      ),
                    ],
                  ),
                ),

                buildLoginAndRegButton("Register", "register", () {
                  Navigator.of(context).pushNamed("register");
                  debugPrint("Register button pressed");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
