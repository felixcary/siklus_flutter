part of 'HomeBloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class TextFieldChanged extends HomeEvent {
  final String value;
  const TextFieldChanged({
    this.value,
  });

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'TextFieldChanged { value: $value}';
}

class ConfirmName extends HomeEvent {
  final String name;

  const ConfirmName({
    this.name,
  });

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'ConfirmName { name: $name}';
}

class AddCounter extends HomeEvent {
  final int counter;

  const AddCounter({
    this.counter,
  });

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'AddCounter { counter: $counter}';
}
