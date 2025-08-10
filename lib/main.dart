import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/presentation/choose_mode/bloc/choose_mode_bloc.dart';
import 'package:spotify/presentation/splash/page/splash_screen.dart';
import 'package:spotify/service_locator.dart';
import 'core/configs/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => sl<ChooseModeBloc>(),
        child: BlocBuilder<ChooseModeBloc, ChooseModeState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state
                    .themeMode,
                home: SplashScreen()
            );
          },
        ),
      ),
    );
  }
}
