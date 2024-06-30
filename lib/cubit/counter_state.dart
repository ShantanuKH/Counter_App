part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  // This comes as soon as we add equatable
  // This props asks for what is to be compared
  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.wasIncremented];
}
