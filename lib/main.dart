import 'package:elearning/firebase_options.dart';
import 'package:elearning/pages/signin_screen/signin_screen.dart';
import 'package:elearning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:elearning/pages/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
              appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
              useMaterial3: true,
            ),
            routes: {
              'welcomeScreen': (_) => const WelcomeScreen(),
              'signInScreen': (_) => const SignInScreen(),
            },
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
