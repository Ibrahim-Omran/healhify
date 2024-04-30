import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/auth/presentation/cubits/log_in_cubit/log_in_state.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/firebase/firebase_auth.dart';
import '../../../../../core/service/service_locator.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
        isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordSuffixIcon());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    debugPrint('Login loading.....!');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emit(LoginSuccessState());
      debugPrint('Login Success.....!');
      await sl<CacheHelper>().saveData(key: 'loginKey', value: true);

      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "user-not-found":
          debugPrint('Login Error.....!');
          emit(LoginErrorState(errorMs: 'user not found'));
          break;
        case "wrong-password":
          emit(LoginErrorState(errorMs: 'wrong password'));
          break;
        case "INVALID_LOGIN_CREDENTIALS":
          debugPrint('Login INVALID_LOGIN_CREDENTIALS.....!');
          emit(LoginErrorState(errorMs: 'User not found or Wrong password !'));
          break;
      }
    } catch (e) {
      debugPrint('Login Error 2.....!');
      emit(LoginErrorState(errorMs: 'something went wrong'));
    }
  }
}
