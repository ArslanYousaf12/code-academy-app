import 'package:code_academy_app/common/widgets/flutter_toast.dart';
import 'package:code_academy_app/screens/register/bloc/register_bloc.dart';
import 'package:code_academy_app/screens/register/bloc/register_events.dart';
import 'package:code_academy_app/screens/register/bloc/register_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController(this.context);

  Future<void> handleEmailSignUp() async {
    final state = context.read<RegisterBloc>().state as RegisterInitialState;
    final email = state.email;
    final password = state.password;
    final confirmPassword = state.confirmPassword;
    final userName = state.userName;
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        userName.isEmpty) {
      // Show error message
      toastInfo(msg: "Please fill all fields");
      return;
    } else if (password != confirmPassword) {
      // Show error message
      toastInfo(msg: "Passwords do not match");
      return;
    } else {
      // Proceed with sign up
      toastInfo(msg: "Signing up with email: $email");
    }
    context.read<RegisterBloc>().add(LoadingEvent(true));
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user?.updateProfile(displayName: userName);
        await userCredential.user?.sendEmailVerification();
        toastInfo(
          msg: "Verification email sent to ${userCredential.user?.email}",
        );
        await userCredential.user?.reload();
        context.read<RegisterBloc>().add(LoadingEvent(false));

        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      context.read<RegisterBloc>().add(LoadingEvent(false));
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "The email address is badly formatted.");
      } else {
        toastInfo(msg: e.message.toString());
      }
    } catch (e) {
      toastInfo(msg: e.toString());
    }
  }
}
