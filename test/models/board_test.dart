import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('Win Game', () {
    Board board = Board(
      myRows: 2,
      myColumns: 2,
      qtBombs: 0,
    );

    board.fields[0].toMine();
    board.fields[3].toMine();

    //Playng...
    board.fields[0].switchMarket();
    board.fields[1].toOpen();
    board.fields[2].toOpen();
    board.fields[3].switchMarket();

    expect(board.solved, isTrue);
  });
}
