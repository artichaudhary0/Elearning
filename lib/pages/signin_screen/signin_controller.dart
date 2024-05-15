import 'package:elearning/pages/signin_screen/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  BuildContext context;
  SignInController({required this.context});

  Future<void> handelSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }

          final user = credential.user;
          if (user != null) {
            // we got verified user from email
          } else {}
        } catch (e) {
          //
        }
      }
    } catch (e) {
      //
    }
  }
}
