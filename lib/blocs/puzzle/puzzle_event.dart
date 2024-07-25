abstract class PuzzleEvent {}

class ShufflePuzzleEvent extends PuzzleEvent {}

class TileTappedPuzzleEvent extends PuzzleEvent {
  final int index;
  TileTappedPuzzleEvent(this.index);
}
