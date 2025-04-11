import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
  int? duration,
}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: backgroundColor ?? Colors.black,
    textColor: textColor ?? Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: duration ?? 1,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0.sp,
  );
}
