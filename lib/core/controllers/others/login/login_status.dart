abstract class LoginStates {}
class LoginInitState extends LoginStates{}
class LoginLoading extends LoginStates{}
class Loginsuccessflly extends LoginStates{}
class FaildToLogin extends LoginStates{
  final String message ;
  FaildToLogin({required this.message});
}
