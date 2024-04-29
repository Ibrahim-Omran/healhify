abstract class SignUpState{}

final class SignUpInitial extends SignUpState{}

class LoadingState extends SignUpState{}
class SuccessState extends SignUpState{}
class ErrorState extends SignUpState{
  String errorMS;
  ErrorState({required this.errorMS});

}
