import 'dart:math';

import 'package:custom_snack_bar/features/reset_password/presentation/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordStates> {
  SetNewPasswordCubit() : super(SetNewPasswordInitalStates());

  Future<void> resetPassword(int number) async {
    emit(SetNewPasswordLoadingState());
    await Future.delayed(Duration(seconds: 1));
    switch (number) {
      case (0):
        {
          emit(SetNewPasswordFailureStates(errors[0]));
          return;
        }
      case (1):
        {
          emit(SetNewPasswordFailureStates(errors[1]));
          return;
        }
      default:
        {
          emit(SetNewPasswordSuccessStates());
          return;
        }
    }
  }

  List<Map<String, dynamic>> errors = [
    {"detail": "Something went wrong!!"},
    {
      "oldPassword": ["old password not correct."],
      "newPassword1": ["new password is not correct."],
      "newPassword2": ["confirm password not match the new one."]
    },
  ];
}
