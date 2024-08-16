import 'package:authentication_with_bloc_firebase_flutter/features/authentication/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/gradient_button.dart';
import '../../../../common/widgets/button/social_button.dart';
import '../../../../common/widgets/input/default_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/bg_balls.png'),
              const Text(
                'Sign in.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              SocialButton(
                  onPressed: () {},
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),
              const SizedBox(height: 20),
              SocialButton(
                onPressed: () {},
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with Facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              DefaultTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              DefaultTextField(
                isPassword: true,
                hintText: 'Password',
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginButtonPressed(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                },
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
