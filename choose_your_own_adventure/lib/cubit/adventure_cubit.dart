import 'package:bloc/bloc.dart';

part 'adventure_state.dart';

class AdventureCubit extends Cubit<AdventureState> {
  AdventureCubit()
      : super(
          AdventureState(nextStoryID: 0),
        );

  void nextStory(int nextID) => emit(
        AdventureState(nextStoryID: nextID),
      );
}
