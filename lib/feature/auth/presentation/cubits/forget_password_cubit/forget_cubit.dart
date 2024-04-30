import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  Future<void> forgetPassword() async {
    emit(ForgetLoadingState());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      debugPrint('Password reset email sent successfully');
      emit(ForgetSuccessState());
      emailController.clear();
    } catch (error) {
      debugPrint('Error sending password reset email: $error');
      emit(ForgetErrorState(errorMs: 'something went wrong'));
    }
  }
}
