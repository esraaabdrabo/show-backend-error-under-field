import 'package:custom_snack_bar/backend_errors.dart';
import 'package:custom_snack_bar/features/reset_password/presentation/reset_password.dart';
import 'package:custom_snack_bar/features/reset_password/presentation/view_model/states.dart';
import 'package:custom_snack_bar/features/reset_password/widgets/form_fields/custom_form_field.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  final SetNewPasswordStates state;
  const ConfirmPasswordField(
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
        keyName: BackEndErrors.newPassword2,
        state: state,
        isPasswordField: true,
        hintText: "Confirm Password",
        controller: TextEditingController());
  }
}
