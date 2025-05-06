import 'package:code_academy_app/screens/common_widget.dart';
import 'package:code_academy_app/screens/register/bloc/register_bloc.dart';
import 'package:code_academy_app/screens/register/bloc/register_events.dart';
import 'package:code_academy_app/screens/register/bloc/register_states.dart';
import 'package:code_academy_app/screens/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        final registerState = state as RegisterInitialState;
        final isLoading = registerState.isLoading;
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
                    SizedBox(height: 20.h),
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

                          buildTextField(
                            "Enter your User name",
                            "name",
                            "user",
                            (value) {
                              context.read<RegisterBloc>().add(
                                UsernameChangedEvent(value),
                              );
                            },
                          ),
                          reusableText("Email"),

                          buildTextField(
                            "Enter your Email address",
                            "email",
                            "user",
                            (value) {
                              context.read<RegisterBloc>().add(
                                EmailChangedEvent(value),
                              );
                            },
                          ),
                          reusableText("Password"),

                          buildTextField(
                            "Enter your Password",
                            "password",
                            "lock",
                            (value) {
                              context.read<RegisterBloc>().add(
                                PasswordChangedEvent(value),
                              );
                            },
                          ),
                          reusableText("Confirm Password"),

                          buildTextField(
                            "Re-Enter your Password to confirm",
                            "password",
                            "lock",
                            (value) {
                              context.read<RegisterBloc>().add(
                                ConfirmPasswordChangedEvent(value),
                              );
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

                    buildLoginAndRegButton(
                      "Sign Up",
                      "login",
                      isLoading,
                      context,
                      () {
                        RegisterController(context).handleEmailSignUp();

                        debugPrint("Register button pressed");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
