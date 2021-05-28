import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'HomeEvent.dart';
part 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is TextFieldChanged) {
      yield* _mapTextFieldChangedToState(event);
    }

    if (event is ConfirmName) {
      yield state.copyWith(name: event.name);
    }

    if (event is AddCounter) {
      yield state.copyWith(counter: event.counter + 1);
    }
  }

  Stream<HomeState> _mapTextFieldChangedToState(TextFieldChanged event) async* {
    if (event.value.isEmpty) {
      yield HomeState(isConfirmable: false);
    } else {
      yield state.copyWith(isConfirmable: true);
    }
  }
}
