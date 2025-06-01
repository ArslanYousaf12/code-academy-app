import 'package:code_academy_app/common/routes/name.dart';
import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/common/values/constants.dart';
import 'package:code_academy_app/global.dart';
import 'package:code_academy_app/screens/application/bloc/app_blocs.dart';
import 'package:code_academy_app/screens/application/bloc/app_events.dart';
import 'package:code_academy_app/screens/profile/settings/widegts/setting_app_bar.dart';
import 'package:code_academy_app/screens/profile/settings/widegts/setting_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    //To clear the state and remove the user token
    // context.read<AppBlocs>().add(TrigerAppEvents(0));
    Global.storageService.remove(AppConstants.USER_TOKEN_KEY);
    FirebaseAuth.instance.signOut();
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.SIGIN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SettingAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [SettingButton(removeUserData: removeUserData)],
          ),
        ),
      ),
    );
  }
}
