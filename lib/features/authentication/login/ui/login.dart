import 'package:authentication_with_bloc_firebase_flutter/features/authentication/login/bloc/login_bloc.dart';
import 'package:authentication_with_bloc_firebase_flutter/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/gradient_button.dart';
import '../../../../common/widgets/button/social_button.dart';
import '../../../../common/widgets/input/default_text_field.dart';
import '../../../home/ui/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          HelperFunction.navigateTo(context, const Home());
        }
        if (state is LoginFailure) {
          HelperFunction.showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/bg_balls.png'),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SocialButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginWithGooglePressed());
                      },
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google'),
                  const SizedBox(height: 20),
                  SocialButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginWithFacebookPressed());
                    },
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
      },
    );
  }
}
