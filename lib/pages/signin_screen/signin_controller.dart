import 'dart:developer';
import 'package:elearning/pages/signin_screen/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handelSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          log('Email is empty');
          return;
        }
        if (password.isEmpty) {
          log('Password is empty');
          return;
        }

        try {
          final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            log('User does not exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            log('User not verified');
            return;
          } else {
            log('User verified');
          }

          final user = credential.user;
          if (user != null) {
            // We got a verified user from email
            log('User exists');
          } else {
            debugPrint('User does not exist');
          }
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'user-not-found':
              log('User not found');
              break;
            case 'wrong-password':
              log('Wrong password provided');
              break;
            case 'invalid-email':
              log('Invalid email');
              break;
            case 'user-disabled':
              log('User disabled');
              break;
            default:
              log('FirebaseAuthException: ${e.code}');
              break;
          }
        } catch (e) {
          log('Exception: $e');
        }
      }
    } catch (e) {
      log('Exception in handelSignIn: $e');
    }
  }
}
