import 'package:authentication_with_bloc_firebase_flutter/features/authentication/gets_started/bloc/gets_started_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/gets_started/ui/gets_started.dart';

void main() {
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