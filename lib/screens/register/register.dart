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
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: reusableText(
                    "Enter your details to below and free sign up",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("UserName"),

                      buildTextField("Enter your User name", "name", "user", (
                        value,
                      ) {
                        // context.read<SiginInBloc>().add(
                        //   EmailEvent(value),
                        // );
                      }),
                      reusableText("Email"),

                      buildTextField(
                        "Enter your Email address",
                        "email",
                        "user",
                        (value) {
                          // context.read<SiginInBloc>().add(
                          //   EmailEvent(value),
                          // );
                        },
                      ),
                      reusableText("Password"),

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
                      reusableText("Confirm Password"),

                      buildTextField(
                        "Re-Enter your Password to confirm",
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
                Center(
                  child: reusableText(
                    "Enter your details to below and free sign up",
                  ),
                ),

                buildLoginAndRegButton("Sign Up", "login", () {
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
