import 'package:elearning/pages/welcome/bloc/welcome_event.dart';
import 'package:elearning/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(InitWelcomeState()) {
    on<WelcomeEvents>((event, emit) {
      emit(
        WelcomeState(
          page: state.page,
        ),
      );
    });
  }
}
