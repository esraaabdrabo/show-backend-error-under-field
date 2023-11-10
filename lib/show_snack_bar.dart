import 'package:custom_snack_bar/backend_errors.dart';
import 'package:custom_snack_bar/main.dart';
import 'package:custom_snack_bar/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

///show a not specific to any form field message
///like     "detail": "User does not exist."
abstract class CustomSnackBar {
  ///on click on cancel icon will call 'hide'
  static hide() => ScaffoldMessenger.of(navigatorKey.currentState!.context)
      .hideCurrentSnackBar();

  ///must only show the details message
  ///so with help of 'FailureState' we will know if this message should me shown or not
  ///if it's true then show the snack bar
  static show({String? sentence, Color? color, Map<String, dynamic>? message}) {
    if (sentence == null) {
      return _canShow(message!) ? _show(message, color) : null;
    } else {
      return _show({"detail": sentence}, color);
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _show(
      Map<String, dynamic> message, Color? color) {
    return ScaffoldMessenger.of(navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.w),
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.5.h),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: _Content(message, color),
      ),
    );
  }

  static bool _canShow(Map<String, dynamic> message) =>
      FailureState.isDetailError(message);
}

class _Content extends StatelessWidget {
  final Map<String, dynamic> message;
  final Color? color;
  const _Content(this.message, this.color);

  @override
  Widget build(BuildContext context) {
    return SnackBarContent(
        message: message['detail']!, color: color ?? Colors.red);
  }
}
