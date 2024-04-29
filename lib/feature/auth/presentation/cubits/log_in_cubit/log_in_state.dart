abstract class LoginState{}

final class LoginInitial extends LoginState{}
final class LoginLoadingState extends LoginState{}
final class LoginSuccessState extends LoginState{}
final class LoginErrorState extends LoginState{
  final String errorMs ;
  LoginErrorState({required this.errorMs});
}

class ChangeLoginPasswordSuffixIcon extends LoginState{}