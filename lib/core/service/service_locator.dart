import 'package:get_it/get_it.dart';
import 'package:healhify/feature/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:healhify/feature/home/presentation/cubit/home_cubit/home_cubit.dart';

import '../../feature/auth/presentation/cubits/forget_password_cubit/forget_cubit.dart';
import '../../feature/home/presentation/cubit/chest_cubit/chest_cubit.dart';
import '../cache/cache_helper.dart';


final sl = GetIt.instance;

Future<void>  initServiceLocator() async {

  // helpers
  sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());

  // cubits
   sl.registerLazySingleton(()=>HomeCubit());
   sl.registerLazySingleton(()=>LoginCubit());
   sl.registerLazySingleton(()=>SignUpCubit());
   sl.registerLazySingleton(()=>ForgetCubit());
   sl.registerLazySingleton(()=>ScanXrayChestCubit());



}