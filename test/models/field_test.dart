/* import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('Field', () {
    test('Open Field WITH Explosion', () {
      Field f = Field(myRow: 0, myColumn: 0);
      f.toMine();

      expect(f.toOpen, throwsException);
    });

    test('Open Field WITHOUT Explosion', () {
      Field f = Field(myRow: 0, myColumn: 0);
      f.toOpen();
      expect(f.opened, isTrue);
    });

    test('Add NOT Neighbor', () {
      Field f1 = Field(myRow: 0, myColumn: 0);
      Field f2 = Field(myRow: 1, myColumn: 3);
      f1.addNeighbor(f2);
      expect(f1.neighbors.isEmpty, isTrue);
    });

    test('Add Neighbor', () {
      Field f1 = Field(myRow: 3, myColumn: 3);
      Field f2 = Field(myRow: 3, myColumn: 4);
      Field f3 = Field(myRow: 2, myColumn: 2);
      Field f4 = Field(myRow: 4, myColumn: 4);
      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);
      expect(f1.neighbors.isEmpty, 3);
    });
  });
}
 */
