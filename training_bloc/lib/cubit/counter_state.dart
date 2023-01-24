part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;
  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  //Add the fields that are used with Equatable
  List<Object?> get props => [counterValue, wasIncremented];
}
