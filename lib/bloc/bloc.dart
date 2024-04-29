import 'package:elearning/bloc/event.dart';
import 'package:elearning/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          InitialState(),
        ) {
    on<Increment>(
      (event, emit) => emit(
        AppState(
          counter: state.counter + 1,
        ),
      ),
    );
  }
}
