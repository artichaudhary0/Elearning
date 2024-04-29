import 'package:elearning/pages/signin_screen/bloc/signin_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  handelSignIn(String type) {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
      }
    } catch (error) {}
  }
}
