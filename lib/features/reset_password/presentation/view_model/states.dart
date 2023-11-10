import 'package:custom_snack_bar/base_states.dart';

abstract class SetNewPasswordStates {}

class SetNewPasswordInitalStates extends SetNewPasswordStates {}

class SetNewPasswordLoadingState extends SetNewPasswordStates {}

class SetNewPasswordRememberMeState extends SetNewPasswordStates {}

class SetNewPasswordSuccessStates extends SetNewPasswordStates {}

class SetNewPasswordFailureStates extends SetNewPasswordStates
    with BaseFailureState {
  SetNewPasswordFailureStates(dynamic message) {
    print(message);
    super.init(message);
  }
}
