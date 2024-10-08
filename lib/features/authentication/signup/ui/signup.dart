import 'package:authentication_with_bloc_firebase_flutter/common/widgets/input/default_text_field.dart';
import 'package:authentication_with_bloc_firebase_flutter/features/home/ui/home.dart';
import 'package:authentication_with_bloc_firebase_flutter/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/gradient_button.dart';
import '../../../../common/widgets/button/social_button.dart';
import '../bloc/signup_bloc.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if(state is SignupSuccess){
          HelperFunction.navigateTo(context, const Home());
        }
        if(state is SignupFailure){
          HelperFunction.showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if(state is SignupLoading){
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/bg_balls.png'),
                  const Text(
                    'Signup',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SocialButton(
                      onPressed: () {
                        context.read<SignupBloc>().add(SignupWithGooglePressed());
                      },
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google'),
                  const SizedBox(height: 20),
                  SocialButton(
                    onPressed: () {
                      context.read<SignupBloc>().add(SignupWithFacebookPressed());
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
                  const SizedBox(height: 15),
                  DefaultTextField(
                    isPassword: true,
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    onPressed: () {
                      context.read<SignupBloc>().add(
                            SignupButtonPressed(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                              confirmPassword: confirmPasswordController.text,
                            ),
                          );
                    },
                    text: 'Signup',
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
