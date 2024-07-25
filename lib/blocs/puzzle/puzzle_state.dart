abstract class PuzzleState {
  final List<int> numbers;
  PuzzleState(this.numbers);
}

class InitialPuzziState extends PuzzleState {
  InitialPuzziState(List<int> numbers) : super(numbers);
}

class ShuffledPuzzleState extends PuzzleState {
  ShuffledPuzzleState(List<int> numbers) : super(numbers);
}

class UpdatedPuzzleState extends PuzzleState {
  UpdatedPuzzleState(List<int> numbers) : super(numbers);
}
