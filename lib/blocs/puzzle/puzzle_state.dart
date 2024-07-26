abstract class PuzzleState {
  final List<int> numbers;
  PuzzleState(this.numbers);
}

class InitialPuzziState extends PuzzleState {
  InitialPuzziState(super.numbers);
}

class ShuffledPuzzleState extends PuzzleState {
  ShuffledPuzzleState(super.numbers);
}

class UpdatedPuzzleState extends PuzzleState {
  UpdatedPuzzleState(super.numbers);
}
