import 'package:custom_snack_bar/features/reset_password/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: const ResetPasswordAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ResetPasswordFormWidget()],
        ),
      ),
    );
  }
}
