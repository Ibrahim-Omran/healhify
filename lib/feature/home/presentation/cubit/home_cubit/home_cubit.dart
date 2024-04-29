
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/mail/presentation/screens/mail_screen.dart';

import '../../../../profile/presentation/screens/profile_screen.dart';
import '../../screens/home_body_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> screens = [
    const ProfileScreen(),
    const HomeBodyScreen(),
    const MailScreen(),

  ];
  int currentIndex = 1;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }


}