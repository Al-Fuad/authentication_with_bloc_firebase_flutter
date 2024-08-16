import 'package:authentication_with_bloc_firebase_flutter/features/authentication/gets_started/bloc/gets_started_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/authentication/login/bloc/login_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/authentication/signup/bloc/signup_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/utils/constants/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/gets_started/ui/gets_started.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetsStartedBloc(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColor.backgroundColor,
        ),
        home: const GetsStarted(),
      ),
    );
  }
}