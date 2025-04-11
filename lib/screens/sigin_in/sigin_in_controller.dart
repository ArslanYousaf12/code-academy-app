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
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: emailAddress,
                password: password,
              );
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }
          var user = credential.user;
          if (user != null) {
            // We got verified user from firebase
          } else {
            // We have error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
