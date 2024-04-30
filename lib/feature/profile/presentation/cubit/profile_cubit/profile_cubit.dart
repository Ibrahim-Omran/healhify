import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/auth/data/models/user_model.dart';
import 'package:healhify/feature/profile/presentation/cubit/profile_cubit/profile_state.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/firebase/firebase_auth.dart';
import '../../../../../core/firebase/firebase_store.dart';
import '../../../../../core/service/service_locator.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  UserModel? userModel;

  void getCurrentUser()async{
    emit(ProfileLoadingState());
    FireStoreController fireStoreController = FireStoreController();
    try{
      userModel = await fireStoreController.getCurrentUser();
      emit(ProfileSuccessState());
    }catch(ex){
      debugPrint(ex.toString());
    }

  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      FireAuthController controller = FireAuthController();
      await controller.logout();
      await sl<CacheHelper>().removeData(key: 'loginKey');
      emit(LogoutSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(LogoutErrorState());
    }
  }

}