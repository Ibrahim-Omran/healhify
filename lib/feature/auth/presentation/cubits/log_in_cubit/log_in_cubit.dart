import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/firebase/firebase_auth.dart';
import '../../../../../core/service/service_locator.dart';
import 'log_in_state.dart';

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
    FireAuthController controller = FireAuthController();
    try {
      await controller.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      emit(LoginSuccessState());
      await sl<CacheHelper>().saveData(key: 'loginKey', value: true);

      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "user-not-found":
          emit(LoginErrorState(errorMs: 'user not found'));
          break;
        case "wrong-password":
          emit(LoginErrorState(errorMs: 'wrong password'));
          break;
        case "INVALID_LOGIN_CREDENTIALS":
          emit(LoginErrorState(errorMs: 'User not found or Wrong password !'));
          break;
      }
    } catch (e) {
      emit(LoginErrorState(errorMs: 'something went wrong'));
    }
  }
}
