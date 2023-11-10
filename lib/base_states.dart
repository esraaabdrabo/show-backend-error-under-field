abstract class BaseShowLoadingState {}

abstract class BaseHideLoadingState {}

mixin class BaseSuccessState {
  dynamic message;

  void init(dynamic message) {
    this.message = message;
  }
}

abstract class BaseUnAuthorizedState {}

///this is a base failure mixin any failure state must be with this mixin
///will be used with any custom form field widget in order to know if the current state is
///failure or not and return the message
mixin BaseFailureState {
  dynamic message;

  void init(dynamic message) {
    this.message = message;
  }
}
