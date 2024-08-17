import 'package:authentication_with_bloc_firebase_flutter/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLogoutSuccess) {
          Navigator.popUntil(context, (route) => route.isFirst);
        } else if (state is HomeLogoutFailure) {
          HelperFunction.showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is HomeLogoutInProgress) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Home'),
            actions: [
              //logout button
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.read<HomeBloc>().add(LogoutButtonPressed());
                },
              ),
            ],
          ),
          body: const Center(
            child: Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}
