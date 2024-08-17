import 'package:authentication_with_bloc_firebase_flutter/features/authentication/gets_started/bloc/gets_started_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/authentication/gets_started/ui/gets_started.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/authentication/login/bloc/login_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/authentication/signup/bloc/signup_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/home/bloc/home_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

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
        BlocProvider(
          create: (context) => HomeBloc(),
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
