import 'package:code_academy_app/common/routes/routes.dart';
import 'package:code_academy_app/common/widgets/flutter_toast.dart';
import 'package:code_academy_app/screens/sigin_in/bloc/sigin_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginInController {
  SiginInController({required this.context});
  final BuildContext context;

  void handleSiginIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SiginInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
          //
          debugPrint("Email is empty");
          toastInfo(msg: "Email is empty");
          return;
        }
        if (password.isEmpty) {
          debugPrint("Password is empty");
          toastInfo(msg: "Password is empty");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: emailAddress,
                password: password,
              );
          if (credential.user == null) {
            //
            debugPrint("User is null");
            toastInfo(msg: "User is null");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            debugPrint("Email is not verified");
            toastInfo(msg: "Email is not verified");
            return;
          }
          var user = credential.user;
          if (user != null) {
            // We got verified user from firebase
            debugPrint("User is verified");
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.APPLICATION,
              (route) => false,
            );
            toastInfo(msg: "User is verified");
          } else {
            // We have error getting user from firebase
            debugPrint("Error getting user from firebase");
            toastInfo(msg: "Error getting user from firebase");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            debugPrint("No user found for that email.");
            toastInfo(msg: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            debugPrint("Wrong password provided for that user.");
            toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            debugPrint("The email address is badly formatted.");
            toastInfo(msg: "The email address is badly formatted.");
          } else if (e.code == 'user-disabled') {
            debugPrint("User is disabled.");
            toastInfo(msg: "User is disabled.");
          } else if (e.code == 'operation-not-allowed') {
            debugPrint("Operation not allowed.");
            toastInfo(msg: "Operation not allowed.");
          } else {
            debugPrint("Error: ${e.message}");
            toastInfo(msg: "Error: ${e.message}");
          }
        }
      }
    } catch (e) {
      // Handle any other errors that may occur
      debugPrint("Error: $e");
      toastInfo(msg: "Error: $e");
    } finally {
      // Perform any cleanup or final actions here
      debugPrint("SiginIn process completed");
    }
  }
}
