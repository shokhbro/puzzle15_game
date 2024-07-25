import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle15_game/blocs/puzzle/puzzle_event.dart';
import 'package:puzzle15_game/blocs/puzzle/puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc()
      : super(
          InitialPuzziState(
            List.generate(16, (index) => index),
          ),
        ) {
    on<ShufflePuzzleEvent>((event, emit) {
      final numbers = List<int>.from(state.numbers);
      numbers.shuffle();
      emit(ShuffledPuzzleState(numbers));
    });

    on<TileTappedPuzzleEvent>((event, emit) {
      final numbers = List<int>.from(state.numbers);
      _moveTile(numbers, event.index);
      emit(UpdatedPuzzleState(numbers));
    });
  }

  void _moveTile(List<int> numbers, int index) {
    int emptyIndex = numbers.indexOf(0);
    if (_isAdjacent(index, emptyIndex)) {
      numbers[emptyIndex] = numbers[index];
      numbers[index] = 0;
    }
  }

  bool _isAdjacent(int index, int emptyIndex) {
    int row = index ~/ 4;
    int col = index % 4;
    int emptyRow = emptyIndex ~/ 4;
    int emptyCol = emptyIndex % 4;

    return (row == emptyRow && (col - emptyCol).abs() == 1) ||
        (col == emptyCol && (row - emptyRow).abs() == 1);
  }
}
