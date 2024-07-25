import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle15_game/blocs/puzzle/puzzle_bloc.dart';
import 'package:puzzle15_game/blocs/puzzle/puzzle_event.dart';
import 'package:puzzle15_game/blocs/puzzle/puzzle_state.dart';
import 'package:puzzle15_game/ui/widgets/logic_button.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzleBloc()..add(ShufflePuzzleEvent()),
      child: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: const Text(
            "Puzzle Game",
            style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
        body: BlocBuilder<PuzzleBloc, PuzzleState>(
          builder: (context, state) {
            if (state is InitialPuzziState ||
                state is ShuffledPuzzleState ||
                state is UpdatedPuzzleState) {
              final numbers = state.numbers;
              final colors = [
                Colors.red,
                Colors.teal,
                Colors.green,
                Colors.cyan,
                Colors.deepOrange,
                Colors.amber,
              ];
              return Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 350,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: numbers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return numbers[index] != 0
                          ? GestureDetector(
                              onTap: () => context
                                  .read<PuzzleBloc>()
                                  .add(TileTappedPuzzleEvent(index)),
                              child: LogicButton(
                                number: numbers[index],
                                color: colors[index % colors.length],
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
