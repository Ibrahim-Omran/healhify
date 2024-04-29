import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart';

import '../../../../../core/firebase/firebase_auth.dart';
import '../../../../../core/firebase/firebase_store.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  // sign up
  Future<void> signUp() async {
    emit(LoadingState());
    FireAuthController controller = FireAuthController();
    try {

      await controller.signUp(
          email: emailController.text,
          password: passwordController.text,
          userName: nameController.text,
      );
      emit(SuccessState());
      await addUserData();

      emailController.clear();
      nameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "weak-password":
          emit(ErrorState(errorMS: 'weak password'));
          break;
        case "email-already-in-use":
          emit(ErrorState(errorMS: 'email-already exists'));
          break;
      }
    }
    catch(e){
      emit(ErrorState(errorMS: 'there was an error'));
    }
  }

  Future<void> addUserData() async {
    FireStoreController fireStoreController = FireStoreController();
    await fireStoreController.addUserData(
        idUser: FirebaseAuth.instance.currentUser!.uid.toString(),
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text
    );
  }

}