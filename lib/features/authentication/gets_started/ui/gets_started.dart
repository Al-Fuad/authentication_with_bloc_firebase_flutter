import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/gradient_button.dart';
import '../../login/ui/login.dart';
import '../../signup/ui/signup.dart';
import '../bloc/gets_started_bloc.dart';

class GetsStarted extends StatelessWidget {
  const GetsStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetsStartedBloc, GetsStartedState>(
      listener: (context, state) {
        if (state is GetsStartedSignupButtonPressedState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
        }
        if (state is GetsStartedLoginButtonPressedState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/bg_balls.png"),
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  constraints: const BoxConstraints(maxWidth: 395),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gets Started",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome to our app. Let's get started!",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientButton(
                      onPressed: () {
                        context
                            .read<GetsStartedBloc>()
                            .add(GetsStartedSignupButtonPressed());
                      },
                      text: "Sign Up",
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    GradientButton(
                      onPressed: () {
                        context
                            .read<GetsStartedBloc>()
                            .add(GetsStartedLoginButtonPressed());
                      },
                      text: "Login",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
