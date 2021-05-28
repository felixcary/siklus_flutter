part of 'HomeBloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isConfirmable = false,
    this.counter = 0,
    this.name = "",
  });

  final bool isConfirmable;
  final int counter;
  final String name;

  HomeState copyWith({
    bool isConfirmable,
    int counter,
    String name,
  }) {
    return HomeState(
      isConfirmable: isConfirmable ?? this.isConfirmable,
      counter: counter ?? this.counter,
      name: name ?? this.name,
    );
  }

  @override
  String toString() =>
      'HomeState { isConfirmable: $isConfirmable, counter: $counter, name: $name }';

  @override
  List<Object> get props => [isConfirmable, counter, name];
}
