import 'package:custom_snack_bar/base_states.dart';

enum _BackEndErrorsKeys {
  email,
  phone,
  oldPassword,
  newPassword1,
  newPassword2
}

abstract class BackEndErrors {
  static String get email => _BackEndErrorsKeys.email.name;
  static String get phone => _BackEndErrorsKeys.phone.name;

  static String get oldPassword => _BackEndErrorsKeys.oldPassword.name;
  static String get newPassword1 => _BackEndErrorsKeys.newPassword1.name;
  static String get newPassword2 => _BackEndErrorsKeys.newPassword2.name;
}

class FailureModel {
  late Map<String, dynamic> message;
  FailureModel({required this.message});
}

abstract class FailureState {
  ///know if the gived param is a faliure state or not
  ///return type [bool] true if it's failure state .
  static _isFailure(state) => state is BaseFailureState;

  ///param [state] dynamic value which will be checked if it's a 'BaseFailureState'
  ///then the function will return the message else will return null
  static String? getError({required state, required String key}) {
    if (_isFailure(state)) {
      return _getMessage(state, key);
    } else {
      return null;
    }
  }

  ///we have 2 types of errors
  ///1- detail error which will be shown with snackbar
  ///2- form field error which must be returned to be shown under the form field
  ///param [state] check wheter this state is a failure state or not
  ///[key] which form field is calling this method to get the error? will be known from it's key
  static String? _getMessage(state, String key) {
    BaseFailureState faliure = state as BaseFailureState;
    return isDetailError(state.message)
        ? null
        : _getSpecificFieldMessage(faliure, key);
  }

  static String? _getSpecificFieldMessage(
      BaseFailureState faliure, String key) {
    //list map
    //map
    if (faliure.message is List) {
      return _handleErrorsList(faliure, key);
    } else {
      return _handleErrorsMap(faliure, key);
    }
  }

  static String? _handleErrorsMap(BaseFailureState faliure, String key) {
    if ((faliure.message as Map<String, dynamic>).containsKey(key)) {
      return (faliure.message as Map<String, dynamic>)[key][0];
    }
    return null;
  }

  static String? _handleErrorsList(BaseFailureState faliure, String key) {
    List<Map<String, dynamic>> errorsList = faliure.message;
    for (var item in errorsList) {
      if (item.containsKey(key)) {
        //this is what we search for

        return item.values.first;
      }
      break;
    }
    return null;
  }

  ///check for the state message if it's a detail error by tring convert the map into
  ///'DetailError' if everything done succefully then return true
  ///if an exception has been thrown then this is another type and return false
  static bool isDetailError(Map<String, dynamic> data) {
    try {
      DetailError.fromJson(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}

///the Detail error class descripe one type of the 'BackEndError' class
///this error must be shown in snack bar and any other type will be shown under the
///form field
///example
/// {
///  "detail": "User does not exist."
/// }
class DetailError extends BackEndErrors {
  late final String detail;
  DetailError(this.detail);
  DetailError.fromJson(Map<String, dynamic> data) {
    detail = data['detail'];
  }
}
