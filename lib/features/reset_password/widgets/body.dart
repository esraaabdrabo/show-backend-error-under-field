import 'package:custom_snack_bar/features/reset_password/presentation/view_model/cubit.dart';
import 'package:custom_snack_bar/features/reset_password/presentation/view_model/states.dart';
import 'package:custom_snack_bar/features/reset_password/widgets/form_fields/all_form_fields.dart';
import 'package:custom_snack_bar/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetNewPasswordCubit(),
      child: Column(
        children: [
          const ResetPasswordFormFields(),
          const SizedBox(height: 10),
          BlocConsumer<SetNewPasswordCubit, SetNewPasswordStates>(
            listener: (context, state) => _handleStates(state, context),
            builder: (context, state) => state is SetNewPasswordLoadingState
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      MaterialButton(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.tealAccent,
                        onPressed: () => _reset(context, 1),
                        child: const Text("get Error Under Fields"),
                      ),
                      MaterialButton(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.tealAccent,
                        onPressed: () => _reset(context, 2),
                        child: const Text("show success snackbar"),
                      ),
                      MaterialButton(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.tealAccent,
                        onPressed: () => _reset(context, 0),
                        child: const Text("show error snackbar"),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  void _reset(BuildContext context, int value) {
    BlocProvider.of<SetNewPasswordCubit>(context).resetPassword(value);
  }

  void _handleStates(SetNewPasswordStates state, BuildContext context) {
    if (state is SetNewPasswordFailureStates) {
      CustomSnackBar.show(message: state.message);
    } else if (state is SetNewPasswordSuccessStates) {
      CustomSnackBar.show(
          color: Colors.green,
          sentence: "password has been changed succefully");
    }
  }
}
