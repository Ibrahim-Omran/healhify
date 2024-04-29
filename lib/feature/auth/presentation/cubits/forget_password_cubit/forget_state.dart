abstract class ForgetState{}

final class ForgetInitial extends ForgetState{}

final class ForgetLoadingState extends ForgetState{}
final class ForgetSuccessState extends ForgetState{}
final class ForgetErrorState extends ForgetState{
  final String errorMs ;
  ForgetErrorState({required this.errorMs});
}