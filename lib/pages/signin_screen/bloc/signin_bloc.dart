import 'dart:developer';

import 'package:elearning/pages/signin_screen/bloc/signin_events.dart';
import 'package:elearning/pages/signin_screen/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    // handler for email event
    on<EmailEvent>(_emailEvent);

    // handler for password event
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    log(event.email);
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    log(event.password);
    emit(
      state.copyWith(password: event.password),
    );
  }
}
