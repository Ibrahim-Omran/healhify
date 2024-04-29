import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healhify/feature/auth/presentation/cubits/forget_password_cubit/forget_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:healhify/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:healhify/feature/home/presentation/cubit/chest_cubit/chest_cubit.dart';
import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/cache/cache_helper.dart';
import 'core/service/service_locator.dart';
import 'feature/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SignUpCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ScanXrayChestCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
