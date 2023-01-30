part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;
  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  //Add the fields that are used with Equatable
  List<Object?> get props => [counterValue, wasIncremented];

  //For Hydrated bloc - right click CounterState -> generate -> toMap/fromMap
  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }
//Generate this so it's easy to print out the value when using BlocObserver
  @override
  String toString() {
    return 'CounterState{counterValue: $counterValue, wasIncemented: $wasIncremented}';
  }

/*
  //Can generate up until this point from CounterState - this part was in the tutorial but seems to work without this
  String toJson() => jsonEncode(toMap());
  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(jsonDecode(source));

 */
}
