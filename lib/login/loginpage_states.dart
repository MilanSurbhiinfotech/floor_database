abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginCompleteState extends LoginState {}

class ResetLinkCompleteState extends LoginState {
  String user_id;

  ResetLinkCompleteState(this.user_id);
}

class OTPVerficationCompleteState extends LoginState {
  String user_id;

  OTPVerficationCompleteState(this.user_id);
}

class LoginErrorState extends LoginState {
  String message;

  LoginErrorState(this.message);
}
