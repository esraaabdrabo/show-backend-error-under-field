import 'package:custom_snack_bar/features/reset_password/presentation/view_model/cubit.dart';
import 'package:custom_snack_bar/features/reset_password/presentation/view_model/states.dart';
import 'package:custom_snack_bar/features/reset_password/widgets/form_fields/confirm_password.dart';
import 'package:custom_snack_bar/features/reset_password/widgets/form_fields/current_password.dart';
import 'package:custom_snack_bar/features/reset_password/widgets/form_fields/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordFormFields extends StatelessWidget {
  const ResetPasswordFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetNewPasswordCubit, SetNewPasswordStates>(
        buildWhen: (previous, current) =>
            current is SetNewPasswordFailureStates,
        builder: (context, state) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildFormField(state, index),
              separatorBuilder: (context, index) => SizedBox(height: 1.5.h),
              itemCount: 3);
        });
  }

  StatelessWidget _buildFormField(SetNewPasswordStates state, int index) => [
        CurrentPasswordField(state),
        NewPasswordField(state),
        ConfirmPasswordField(state),
      ][index];
}
